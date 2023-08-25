use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_newPushState(port_: i64) {
    wire_newPushState_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_get_handles(port_: i64, state: wire_PushState) {
    wire_get_handles_impl(port_, state)
}

#[no_mangle]
pub extern "C" fn wire_validate_targets(
    port_: i64,
    state: wire_PushState,
    targets: *mut wire_StringList,
) {
    wire_validate_targets_impl(port_, state, targets)
}

#[no_mangle]
pub extern "C" fn wire_cancel_registration(port_: i64, state: wire_PushState) {
    wire_cancel_registration_impl(port_, state)
}

#[no_mangle]
pub extern "C" fn wire_get_phase(port_: i64, state: wire_PushState) {
    wire_get_phase_impl(port_, state)
}

#[no_mangle]
pub extern "C" fn wire_restore(
    port_: i64,
    curr_state: wire_PushState,
    data: *mut wire_uint_8_list,
) {
    wire_restore_impl(port_, curr_state, data)
}

#[no_mangle]
pub extern "C" fn wire_new_push(port_: i64, state: wire_PushState) {
    wire_new_push_impl(port_, state)
}

#[no_mangle]
pub extern "C" fn wire_try_auth(
    port_: i64,
    state: wire_PushState,
    username: *mut wire_uint_8_list,
    password: *mut wire_uint_8_list,
) {
    wire_try_auth_impl(port_, state, username, password)
}

#[no_mangle]
pub extern "C" fn wire_register_ids(
    port_: i64,
    state: wire_PushState,
    validation_data: *mut wire_uint_8_list,
) {
    wire_register_ids_impl(port_, state, validation_data)
}

#[no_mangle]
pub extern "C" fn wire_save_push(port_: i64, state: wire_PushState) {
    wire_save_push_impl(port_, state)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_PushState() -> wire_PushState {
    wire_PushState::new_with_null_ptr()
}

#[no_mangle]
pub extern "C" fn new_StringList_0(len: i32) -> *mut wire_StringList {
    let wrap = wire_StringList {
        ptr: support::new_leak_vec_ptr(<*mut wire_uint_8_list>::new_with_null_ptr(), len),
        len,
    };
    support::new_leak_box_ptr(wrap)
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

#[no_mangle]
pub extern "C" fn drop_opaque_PushState(ptr: *const c_void) {
    unsafe {
        Arc::<PushState>::decrement_strong_count(ptr as _);
    }
}

#[no_mangle]
pub extern "C" fn share_opaque_PushState(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<PushState>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<RustOpaque<PushState>> for wire_PushState {
    fn wire2api(self) -> RustOpaque<PushState> {
        unsafe { support::opaque_from_dart(self.ptr as _) }
    }
}
impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<Vec<String>> for *mut wire_StringList {
    fn wire2api(self) -> Vec<String> {
        let vec = unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        };
        vec.into_iter().map(Wire2Api::wire2api).collect()
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_PushState {
    ptr: *const core::ffi::c_void,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_StringList {
    ptr: *mut *mut wire_uint_8_list,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_PushState {
    fn new_with_null_ptr() -> Self {
        Self {
            ptr: core::ptr::null(),
        }
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
