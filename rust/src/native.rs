use std::sync::{Arc, RwLock};

use tokio::runtime::{Handle, Runtime};
use uniffi::deps::log::info;

use crate::{api::api::{get_phase, new_push_state, recv_wait, InnerPushState, PushState, RegistrationPhase}, frb_generated::FLUTTER_RUST_BRIDGE_HANDLER};

#[derive(uniffi::Object)] 
pub struct NativePushState {
    state: Arc<PushState>
}

#[uniffi::export(async_runtime = "tokio")]
pub async fn init_native(dir: String) -> Arc<NativePushState> {
    Arc::new(NativePushState {
        state: new_push_state(dir).await.unwrap()
    })
}

#[uniffi::export(async_runtime = "tokio")]
impl NativePushState {

    pub fn get_state(self: Arc<NativePushState>) -> u64 {
        let arc_val = Arc::into_raw(self.state.clone()) as u64;
        info!("emitting state {arc_val}");
        arc_val
    }

    pub async fn get_ready(self: Arc<NativePushState>) -> bool {
        matches!(get_phase(&self.state).await, RegistrationPhase::Registered)
    }

    pub async fn recv_wait(self: Arc<NativePushState>) -> u64 {
        let Some(msg) = recv_wait(&self.state).await else {
            return 0
        };
        let result = Box::into_raw(Box::new(msg)) as u64;
        info!("emitting pointer {result}");
        result
    }
}