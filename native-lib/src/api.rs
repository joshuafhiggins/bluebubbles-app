

use std::sync::{Arc, RwLock};

use anyhow::anyhow;
use flutter_rust_bridge::RustOpaque;
pub use rustpush::{APNSState, APNSConnection, IDSState, IDSUser, IDSError, IMClient, IMessage, RecievedMessage};

use serde::{Serialize, Deserialize};
use tokio::runtime::Runtime;

#[derive(Serialize, Deserialize, Clone)]
struct SavedState {
    push: APNSState,
    auth: IDSState
}

#[derive(PartialEq)]
pub enum RegistrationPhase {
    NOT_STARTED,
    WANTS_USER_PASS,
    WANTS_VALID_ID,
    REGISTERED
}

pub struct InnerPushState {
    conn: Option<Arc<APNSConnection>>,
    user: Option<IDSUser>,
    client: Option<IMClient>
}

pub struct PushState (RwLock<InnerPushState>, RwLock<Runtime>);

pub enum PushResult {
    TwoFaError,
    AuthError,
    RegisterFailed {
        code: u64
    },
    UnknownError {
        text: String
    }
}

impl From<IDSError> for PushResult {
    fn from(value: IDSError) -> Self {
        match value {
            IDSError::TwoFaError =>
                PushResult::TwoFaError,
            IDSError::AuthError(_) =>
                PushResult::AuthError,
            IDSError::RegisterFailed(err) =>
                PushResult::RegisterFailed { code: err },
            _error => PushResult::UnknownError { text: format!("{:?}", _error) }
        }
    }
}

pub fn newPushState() -> RustOpaque<PushState> {
    RustOpaque::new(PushState(RwLock::new(InnerPushState {
        conn: None,
        user: None,
        client: None
    }), RwLock::new(Runtime::new().unwrap())))
}

/*pub fn recv_wait(state: RustOpaque<PushState>) -> Option<RecievedMessage> {
    state.1.read().unwrap().block_on(async {
        if state.get_phase() != RegistrationPhase::REGISTERED {
            panic!("Wrong phase! (recv_wait)")
        }
        state.0.read().unwrap().client.as_ref().unwrap().recieve_wait().await
    })
}*/
/*pub async fn send(&self, mut msg: IMessage) -> anyhow::Result<()> {
    if self.get_phase().await != RegistrationPhase::REGISTERED {
        panic!("Wrong phase! (send)")
    }
    self.0.read().await.client.as_ref().unwrap().send(&mut msg).await?;
    Ok(())
}*/

pub fn get_handles(state: RustOpaque<PushState>) -> anyhow::Result<Vec<String>> {
    if state.get_phase() != RegistrationPhase::REGISTERED {
        panic!("Wrong phase! (send)")
    }
    Ok(state.0.read().unwrap().client.as_ref().unwrap().get_handles().to_vec())
}

/*pub async fn new_msg(state: RustOpaque<PushState>, text: String, targets: Vec<String>, group_id: String) -> IMessage {
    if state.get_phase() != RegistrationPhase::REGISTERED {
        panic!("Wrong phase! (new_msg)")
    }
    state.0.read().unwrap().client.as_ref().unwrap().new_msg(&text, &targets, &group_id)
}*/

pub fn validate_targets(state: RustOpaque<PushState>, targets: Vec<String>) -> anyhow::Result<Vec<String>> {
    state.1.read().unwrap().block_on(async {
        if state.get_phase() != RegistrationPhase::REGISTERED {
            panic!("Wrong phase! (validate_targets)")
        }
        Ok(state.0.read().unwrap().client.as_ref().unwrap().validate_targets(&targets).await?)
    })
}
pub fn cancel_registration(state: RustOpaque<PushState>) {
    if state.get_phase() != RegistrationPhase::WANTS_VALID_ID {
        return
    }
    let mut inner = state.0.write().unwrap();
    inner.user = None
}

pub fn get_phase(state: RustOpaque<PushState>) -> u64 {
    match state.get_phase() {
        RegistrationPhase::NOT_STARTED => 0,
        RegistrationPhase::WANTS_USER_PASS => 1,
        RegistrationPhase::WANTS_VALID_ID => 2,
        RegistrationPhase::REGISTERED => 3
    }
}

pub fn restore(curr_state: RustOpaque<PushState>, data: String) {
    curr_state.1.read().unwrap().block_on(async {
        if curr_state.get_phase() != RegistrationPhase::NOT_STARTED {
            panic!("Wrong phase! (restore)")
        }
    
        let state: SavedState = serde_json::from_str(&data).unwrap();
    
        let connection = Arc::new(APNSConnection::new(Some(state.push.clone())).await.unwrap());
        connection.submitter.set_state(1).await;
        connection.submitter.filter(&["com.apple.madrid"]).await;
        let mut inner = curr_state.0.write().unwrap();
        inner.conn = Some(connection);
    
        let user = Arc::new(IDSUser::restore_authentication(state.auth.clone()));
    
        inner.client = Some(IMClient::new(inner.conn.as_ref().unwrap().clone(), user.clone()).await);
    })
}

pub fn new_push(state: RustOpaque<PushState>) {
    state.1.read().unwrap().block_on(async {
        if state.get_phase() != RegistrationPhase::NOT_STARTED {
            panic!("Wrong phase! (new_push)")
        }
        let mut inner = state.0.write().unwrap();
        let connection = Arc::new(APNSConnection::new(None).await.unwrap());
        connection.submitter.set_state(1).await;
        connection.submitter.filter(&["com.apple.madrid"]).await;
        inner.conn = Some(connection);
    })
}

pub fn try_auth(state: RustOpaque<PushState>, username: String, password: String) -> anyhow::Result<u64> {
    state.1.read().unwrap().block_on(async {
        if state.get_phase() != RegistrationPhase::WANTS_USER_PASS {
            panic!("Wrong phase! (try_auth)")
        }
        let mut inner = state.0.write().unwrap();
        inner.user = 
            Some(match IDSUser::authenticate(inner.conn.as_ref().unwrap().clone(), username.trim(), password.trim()).await {
                Ok(user) => user,
                Err(err) => {
                    match err {
                        IDSError::TwoFaError =>
                            return Ok(1),
                        IDSError::AuthError(_) =>
                            return Ok(2),
                        _err => {
                            return Err(anyhow!(_err))
                        }
                    }
                }
            });
        
        Ok(0)
    })
}

pub fn register_ids(state: RustOpaque<PushState>, validation_data: String) -> anyhow::Result<u64> {
    state.1.read().unwrap().block_on(async {
        if state.get_phase() != RegistrationPhase::WANTS_VALID_ID {
            panic!("Wrong phase! (register_ids)")
        }
        let mut inner = state.0.write().unwrap();
        let conn_state = inner.conn.as_ref().unwrap().state.clone();
        if let Err(err) = inner.user.as_mut().unwrap().register_id(&conn_state, &validation_data).await {
            return if let IDSError::RegisterFailed(err) = err {
                Ok(err)
            } else {
                Err(anyhow!(err))
            }
        }
        inner.client = Some(IMClient::new(inner.conn.as_ref().unwrap().clone(), Arc::new(inner.user.take().unwrap())).await);
        Ok(0)
    })
}

pub fn save_push(state: RustOpaque<PushState>) -> String {
    if state.get_phase() != RegistrationPhase::REGISTERED {
        panic!("Wrong phase! (save_push)")
    }
    let inner = state.0.read().unwrap();
    let state = SavedState {
        push: inner.conn.as_ref().unwrap().state.clone(),
        auth: inner.client.as_ref().unwrap().user.state.clone()
    };
    serde_json::to_string(&state).unwrap()
}

impl PushState {
    fn get_phase(&self) -> RegistrationPhase {
        let inner = self.0.read().unwrap();
        if inner.conn.is_none() {
            return RegistrationPhase::NOT_STARTED
        }
        if inner.user.is_none() && inner.client.is_none() {
            return RegistrationPhase::WANTS_USER_PASS
        }
        if inner.client.is_none() {
            return RegistrationPhase::WANTS_VALID_ID
        }
        RegistrationPhase::REGISTERED
    }
}