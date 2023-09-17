use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_newPushState(port_: i64) {
    wire_newPushState_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_format_e164(
    port_: i64,
    number: *mut wire_uint_8_list,
    country: *mut wire_uint_8_list,
) {
    wire_format_e164_impl(port_, number, country)
}

#[no_mangle]
pub extern "C" fn wire_recv_wait(port_: i64, state: wire_PushState) {
    wire_recv_wait_impl(port_, state)
}

#[no_mangle]
pub extern "C" fn wire_send(port_: i64, state: wire_PushState, msg: *mut wire_DartIMessage) {
    wire_send_impl(port_, state, msg)
}

#[no_mangle]
pub extern "C" fn wire_get_handles(port_: i64, state: wire_PushState) {
    wire_get_handles_impl(port_, state)
}

#[no_mangle]
pub extern "C" fn wire_new_msg(
    port_: i64,
    state: wire_PushState,
    conversation: *mut wire_DartConversationData,
    message: *mut wire_DartMessage,
) {
    wire_new_msg_impl(port_, state, conversation, message)
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
pub extern "C" fn wire_download_attachment(
    port_: i64,
    state: wire_PushState,
    attachment: *mut wire_DartAttachment,
    path: *mut wire_uint_8_list,
) {
    wire_download_attachment_impl(port_, state, attachment, path)
}

#[no_mangle]
pub extern "C" fn wire_download_mmcs(
    port_: i64,
    state: wire_PushState,
    attachment: *mut wire_DartMMCSFile,
    path: *mut wire_uint_8_list,
) {
    wire_download_mmcs_impl(port_, state, attachment, path)
}

#[no_mangle]
pub extern "C" fn wire_upload_mmcs(port_: i64, state: wire_PushState, path: *mut wire_uint_8_list) {
    wire_upload_mmcs_impl(port_, state, path)
}

#[no_mangle]
pub extern "C" fn wire_upload_attachment(
    port_: i64,
    state: wire_PushState,
    path: *mut wire_uint_8_list,
    mime: *mut wire_uint_8_list,
    uti: *mut wire_uint_8_list,
    name: *mut wire_uint_8_list,
) {
    wire_upload_attachment_impl(port_, state, path, mime, uti, name)
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

#[no_mangle]
pub extern "C" fn wire_save__method__DartAttachment(port_: i64, that: *mut wire_DartAttachment) {
    wire_save__method__DartAttachment_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_restore__static_method__DartAttachment(
    port_: i64,
    saved: *mut wire_uint_8_list,
) {
    wire_restore__static_method__DartAttachment_impl(port_, saved)
}

#[no_mangle]
pub extern "C" fn wire_get_size__method__DartAttachment(
    port_: i64,
    that: *mut wire_DartAttachment,
) {
    wire_get_size__method__DartAttachment_impl(port_, that)
}

#[no_mangle]
pub extern "C" fn wire_as_plain__method__DartMessageParts(
    port_: i64,
    that: *mut wire_DartMessageParts,
) {
    wire_as_plain__method__DartMessageParts_impl(port_, that)
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
pub extern "C" fn new_box_autoadd_dart_attachment_0() -> *mut wire_DartAttachment {
    support::new_leak_box_ptr(wire_DartAttachment::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_balloon_body_0() -> *mut wire_DartBalloonBody {
    support::new_leak_box_ptr(wire_DartBalloonBody::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_change_participant_message_0(
) -> *mut wire_DartChangeParticipantMessage {
    support::new_leak_box_ptr(wire_DartChangeParticipantMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_conversation_data_0() -> *mut wire_DartConversationData {
    support::new_leak_box_ptr(wire_DartConversationData::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_edit_message_0() -> *mut wire_DartEditMessage {
    support::new_leak_box_ptr(wire_DartEditMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_i_message_0() -> *mut wire_DartIMessage {
    support::new_leak_box_ptr(wire_DartIMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_icon_change_message_0() -> *mut wire_DartIconChangeMessage {
    support::new_leak_box_ptr(wire_DartIconChangeMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_message_0() -> *mut wire_DartMessage {
    support::new_leak_box_ptr(wire_DartMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_message_parts_0() -> *mut wire_DartMessageParts {
    support::new_leak_box_ptr(wire_DartMessageParts::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_mmcs_file_0() -> *mut wire_DartMMCSFile {
    support::new_leak_box_ptr(wire_DartMMCSFile::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_normal_message_0() -> *mut wire_DartNormalMessage {
    support::new_leak_box_ptr(wire_DartNormalMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_react_message_0() -> *mut wire_DartReactMessage {
    support::new_leak_box_ptr(wire_DartReactMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_rename_message_0() -> *mut wire_DartRenameMessage {
    support::new_leak_box_ptr(wire_DartRenameMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_dart_unsend_message_0() -> *mut wire_DartUnsendMessage {
    support::new_leak_box_ptr(wire_DartUnsendMessage::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_usize_0(value: usize) -> *mut usize {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_list_dart_indexed_message_part_0(
    len: i32,
) -> *mut wire_list_dart_indexed_message_part {
    let wrap = wire_list_dart_indexed_message_part {
        ptr: support::new_leak_vec_ptr(<wire_DartIndexedMessagePart>::new_with_null_ptr(), len),
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

impl Wire2Api<DartAttachment> for *mut wire_DartAttachment {
    fn wire2api(self) -> DartAttachment {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartAttachment>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartBalloonBody> for *mut wire_DartBalloonBody {
    fn wire2api(self) -> DartBalloonBody {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartBalloonBody>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartChangeParticipantMessage> for *mut wire_DartChangeParticipantMessage {
    fn wire2api(self) -> DartChangeParticipantMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartChangeParticipantMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartConversationData> for *mut wire_DartConversationData {
    fn wire2api(self) -> DartConversationData {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartConversationData>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartEditMessage> for *mut wire_DartEditMessage {
    fn wire2api(self) -> DartEditMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartEditMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartIMessage> for *mut wire_DartIMessage {
    fn wire2api(self) -> DartIMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartIMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartIconChangeMessage> for *mut wire_DartIconChangeMessage {
    fn wire2api(self) -> DartIconChangeMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartIconChangeMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartMessage> for *mut wire_DartMessage {
    fn wire2api(self) -> DartMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartMessageParts> for *mut wire_DartMessageParts {
    fn wire2api(self) -> DartMessageParts {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartMessageParts>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartMMCSFile> for *mut wire_DartMMCSFile {
    fn wire2api(self) -> DartMMCSFile {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartMMCSFile>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartNormalMessage> for *mut wire_DartNormalMessage {
    fn wire2api(self) -> DartNormalMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartNormalMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartReactMessage> for *mut wire_DartReactMessage {
    fn wire2api(self) -> DartReactMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartReactMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartRenameMessage> for *mut wire_DartRenameMessage {
    fn wire2api(self) -> DartRenameMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartRenameMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DartUnsendMessage> for *mut wire_DartUnsendMessage {
    fn wire2api(self) -> DartUnsendMessage {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DartUnsendMessage>::wire2api(*wrap).into()
    }
}
impl Wire2Api<usize> for *mut usize {
    fn wire2api(self) -> usize {
        unsafe { *support::box_from_leak_ptr(self) }
    }
}
impl Wire2Api<DartAttachment> for wire_DartAttachment {
    fn wire2api(self) -> DartAttachment {
        DartAttachment {
            a_type: self.a_type.wire2api(),
            part_idx: self.part_idx.wire2api(),
            uti_type: self.uti_type.wire2api(),
            mime: self.mime.wire2api(),
            name: self.name.wire2api(),
            iris: self.iris.wire2api(),
        }
    }
}
impl Wire2Api<DartAttachmentType> for wire_DartAttachmentType {
    fn wire2api(self) -> DartAttachmentType {
        match self.tag {
            0 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Inline);
                DartAttachmentType::Inline(ans.field0.wire2api())
            },
            1 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.MMCS);
                DartAttachmentType::MMCS(ans.field0.wire2api())
            },
            _ => unreachable!(),
        }
    }
}
impl Wire2Api<DartBalloonBody> for wire_DartBalloonBody {
    fn wire2api(self) -> DartBalloonBody {
        DartBalloonBody {
            bid: self.bid.wire2api(),
            data: self.data.wire2api(),
        }
    }
}
impl Wire2Api<DartChangeParticipantMessage> for wire_DartChangeParticipantMessage {
    fn wire2api(self) -> DartChangeParticipantMessage {
        DartChangeParticipantMessage {
            new_participants: self.new_participants.wire2api(),
            group_version: self.group_version.wire2api(),
        }
    }
}
impl Wire2Api<DartConversationData> for wire_DartConversationData {
    fn wire2api(self) -> DartConversationData {
        DartConversationData {
            participants: self.participants.wire2api(),
            cv_name: self.cv_name.wire2api(),
            sender_guid: self.sender_guid.wire2api(),
        }
    }
}
impl Wire2Api<DartEditMessage> for wire_DartEditMessage {
    fn wire2api(self) -> DartEditMessage {
        DartEditMessage {
            tuuid: self.tuuid.wire2api(),
            edit_part: self.edit_part.wire2api(),
            new_parts: self.new_parts.wire2api(),
        }
    }
}
impl Wire2Api<DartIMessage> for wire_DartIMessage {
    fn wire2api(self) -> DartIMessage {
        DartIMessage {
            id: self.id.wire2api(),
            sender: self.sender.wire2api(),
            after_guid: self.after_guid.wire2api(),
            conversation: self.conversation.wire2api(),
            message: self.message.wire2api(),
            sent_timestamp: self.sent_timestamp.wire2api(),
        }
    }
}
impl Wire2Api<DartIconChangeMessage> for wire_DartIconChangeMessage {
    fn wire2api(self) -> DartIconChangeMessage {
        DartIconChangeMessage {
            file: self.file.wire2api(),
            group_version: self.group_version.wire2api(),
        }
    }
}
impl Wire2Api<DartIndexedMessagePart> for wire_DartIndexedMessagePart {
    fn wire2api(self) -> DartIndexedMessagePart {
        DartIndexedMessagePart(self.field0.wire2api(), self.field1.wire2api())
    }
}
impl Wire2Api<DartMessage> for wire_DartMessage {
    fn wire2api(self) -> DartMessage {
        match self.tag {
            0 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Message);
                DartMessage::Message(ans.field0.wire2api())
            },
            1 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.RenameMessage);
                DartMessage::RenameMessage(ans.field0.wire2api())
            },
            2 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.ChangeParticipants);
                DartMessage::ChangeParticipants(ans.field0.wire2api())
            },
            3 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.React);
                DartMessage::React(ans.field0.wire2api())
            },
            4 => DartMessage::Delivered,
            5 => DartMessage::Read,
            6 => DartMessage::Typing,
            7 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Unsend);
                DartMessage::Unsend(ans.field0.wire2api())
            },
            8 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Edit);
                DartMessage::Edit(ans.field0.wire2api())
            },
            9 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.IconChange);
                DartMessage::IconChange(ans.field0.wire2api())
            },
            10 => DartMessage::StopTyping,
            _ => unreachable!(),
        }
    }
}
impl Wire2Api<DartMessagePart> for wire_DartMessagePart {
    fn wire2api(self) -> DartMessagePart {
        match self.tag {
            0 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Text);
                DartMessagePart::Text(ans.field0.wire2api())
            },
            1 => unsafe {
                let ans = support::box_from_leak_ptr(self.kind);
                let ans = support::box_from_leak_ptr(ans.Attachment);
                DartMessagePart::Attachment(ans.field0.wire2api())
            },
            _ => unreachable!(),
        }
    }
}
impl Wire2Api<DartMessageParts> for wire_DartMessageParts {
    fn wire2api(self) -> DartMessageParts {
        DartMessageParts(self.field0.wire2api())
    }
}
impl Wire2Api<DartMMCSFile> for wire_DartMMCSFile {
    fn wire2api(self) -> DartMMCSFile {
        DartMMCSFile {
            signature: self.signature.wire2api(),
            object: self.object.wire2api(),
            url: self.url.wire2api(),
            key: self.key.wire2api(),
            size: self.size.wire2api(),
        }
    }
}
impl Wire2Api<DartNormalMessage> for wire_DartNormalMessage {
    fn wire2api(self) -> DartNormalMessage {
        DartNormalMessage {
            parts: self.parts.wire2api(),
            body: self.body.wire2api(),
            effect: self.effect.wire2api(),
            reply_guid: self.reply_guid.wire2api(),
            reply_part: self.reply_part.wire2api(),
        }
    }
}
impl Wire2Api<DartReactMessage> for wire_DartReactMessage {
    fn wire2api(self) -> DartReactMessage {
        DartReactMessage {
            to_uuid: self.to_uuid.wire2api(),
            to_part: self.to_part.wire2api(),
            enable: self.enable.wire2api(),
            reaction: self.reaction.wire2api(),
            to_text: self.to_text.wire2api(),
        }
    }
}

impl Wire2Api<DartRenameMessage> for wire_DartRenameMessage {
    fn wire2api(self) -> DartRenameMessage {
        DartRenameMessage {
            new_name: self.new_name.wire2api(),
        }
    }
}
impl Wire2Api<DartUnsendMessage> for wire_DartUnsendMessage {
    fn wire2api(self) -> DartUnsendMessage {
        DartUnsendMessage {
            tuuid: self.tuuid.wire2api(),
            edit_part: self.edit_part.wire2api(),
        }
    }
}

impl Wire2Api<Vec<DartIndexedMessagePart>> for *mut wire_list_dart_indexed_message_part {
    fn wire2api(self) -> Vec<DartIndexedMessagePart> {
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
pub struct wire_DartAttachment {
    a_type: wire_DartAttachmentType,
    part_idx: u64,
    uti_type: *mut wire_uint_8_list,
    mime: *mut wire_uint_8_list,
    name: *mut wire_uint_8_list,
    iris: bool,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartBalloonBody {
    bid: *mut wire_uint_8_list,
    data: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartChangeParticipantMessage {
    new_participants: *mut wire_StringList,
    group_version: u64,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartConversationData {
    participants: *mut wire_StringList,
    cv_name: *mut wire_uint_8_list,
    sender_guid: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartEditMessage {
    tuuid: *mut wire_uint_8_list,
    edit_part: u64,
    new_parts: wire_DartMessageParts,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartIMessage {
    id: *mut wire_uint_8_list,
    sender: *mut wire_uint_8_list,
    after_guid: *mut wire_uint_8_list,
    conversation: *mut wire_DartConversationData,
    message: wire_DartMessage,
    sent_timestamp: u64,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartIconChangeMessage {
    file: *mut wire_DartMMCSFile,
    group_version: u64,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartIndexedMessagePart {
    field0: wire_DartMessagePart,
    field1: *mut usize,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessageParts {
    field0: *mut wire_list_dart_indexed_message_part,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMMCSFile {
    signature: *mut wire_uint_8_list,
    object: *mut wire_uint_8_list,
    url: *mut wire_uint_8_list,
    key: *mut wire_uint_8_list,
    size: usize,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartNormalMessage {
    parts: wire_DartMessageParts,
    body: *mut wire_DartBalloonBody,
    effect: *mut wire_uint_8_list,
    reply_guid: *mut wire_uint_8_list,
    reply_part: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartReactMessage {
    to_uuid: *mut wire_uint_8_list,
    to_part: u64,
    enable: bool,
    reaction: i32,
    to_text: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartRenameMessage {
    new_name: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartUnsendMessage {
    tuuid: *mut wire_uint_8_list,
    edit_part: u64,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_list_dart_indexed_message_part {
    ptr: *mut wire_DartIndexedMessagePart,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartAttachmentType {
    tag: i32,
    kind: *mut DartAttachmentTypeKind,
}

#[repr(C)]
pub union DartAttachmentTypeKind {
    Inline: *mut wire_DartAttachmentType_Inline,
    MMCS: *mut wire_DartAttachmentType_MMCS,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartAttachmentType_Inline {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartAttachmentType_MMCS {
    field0: *mut wire_DartMMCSFile,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage {
    tag: i32,
    kind: *mut DartMessageKind,
}

#[repr(C)]
pub union DartMessageKind {
    Message: *mut wire_DartMessage_Message,
    RenameMessage: *mut wire_DartMessage_RenameMessage,
    ChangeParticipants: *mut wire_DartMessage_ChangeParticipants,
    React: *mut wire_DartMessage_React,
    Delivered: *mut wire_DartMessage_Delivered,
    Read: *mut wire_DartMessage_Read,
    Typing: *mut wire_DartMessage_Typing,
    Unsend: *mut wire_DartMessage_Unsend,
    Edit: *mut wire_DartMessage_Edit,
    IconChange: *mut wire_DartMessage_IconChange,
    StopTyping: *mut wire_DartMessage_StopTyping,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_Message {
    field0: *mut wire_DartNormalMessage,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_RenameMessage {
    field0: *mut wire_DartRenameMessage,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_ChangeParticipants {
    field0: *mut wire_DartChangeParticipantMessage,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_React {
    field0: *mut wire_DartReactMessage,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_Delivered {}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_Read {}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_Typing {}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_Unsend {
    field0: *mut wire_DartUnsendMessage,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_Edit {
    field0: *mut wire_DartEditMessage,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_IconChange {
    field0: *mut wire_DartIconChangeMessage,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessage_StopTyping {}
#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessagePart {
    tag: i32,
    kind: *mut DartMessagePartKind,
}

#[repr(C)]
pub union DartMessagePartKind {
    Text: *mut wire_DartMessagePart_Text,
    Attachment: *mut wire_DartMessagePart_Attachment,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessagePart_Text {
    field0: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_DartMessagePart_Attachment {
    field0: *mut wire_DartAttachment,
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

impl NewWithNullPtr for wire_DartAttachment {
    fn new_with_null_ptr() -> Self {
        Self {
            a_type: Default::default(),
            part_idx: Default::default(),
            uti_type: core::ptr::null_mut(),
            mime: core::ptr::null_mut(),
            name: core::ptr::null_mut(),
            iris: Default::default(),
        }
    }
}

impl Default for wire_DartAttachment {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl Default for wire_DartAttachmentType {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartAttachmentType {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_DartAttachmentType_Inline() -> *mut DartAttachmentTypeKind {
    support::new_leak_box_ptr(DartAttachmentTypeKind {
        Inline: support::new_leak_box_ptr(wire_DartAttachmentType_Inline {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_DartAttachmentType_MMCS() -> *mut DartAttachmentTypeKind {
    support::new_leak_box_ptr(DartAttachmentTypeKind {
        MMCS: support::new_leak_box_ptr(wire_DartAttachmentType_MMCS {
            field0: core::ptr::null_mut(),
        }),
    })
}

impl NewWithNullPtr for wire_DartBalloonBody {
    fn new_with_null_ptr() -> Self {
        Self {
            bid: core::ptr::null_mut(),
            data: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_DartBalloonBody {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartChangeParticipantMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            new_participants: core::ptr::null_mut(),
            group_version: Default::default(),
        }
    }
}

impl Default for wire_DartChangeParticipantMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartConversationData {
    fn new_with_null_ptr() -> Self {
        Self {
            participants: core::ptr::null_mut(),
            cv_name: core::ptr::null_mut(),
            sender_guid: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_DartConversationData {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartEditMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            tuuid: core::ptr::null_mut(),
            edit_part: Default::default(),
            new_parts: Default::default(),
        }
    }
}

impl Default for wire_DartEditMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartIMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            id: core::ptr::null_mut(),
            sender: core::ptr::null_mut(),
            after_guid: core::ptr::null_mut(),
            conversation: core::ptr::null_mut(),
            message: Default::default(),
            sent_timestamp: Default::default(),
        }
    }
}

impl Default for wire_DartIMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartIconChangeMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            file: core::ptr::null_mut(),
            group_version: Default::default(),
        }
    }
}

impl Default for wire_DartIconChangeMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartIndexedMessagePart {
    fn new_with_null_ptr() -> Self {
        Self {
            field0: Default::default(),
            field1: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_DartIndexedMessagePart {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl Default for wire_DartMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_DartMessage_Message() -> *mut DartMessageKind {
    support::new_leak_box_ptr(DartMessageKind {
        Message: support::new_leak_box_ptr(wire_DartMessage_Message {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_DartMessage_RenameMessage() -> *mut DartMessageKind {
    support::new_leak_box_ptr(DartMessageKind {
        RenameMessage: support::new_leak_box_ptr(wire_DartMessage_RenameMessage {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_DartMessage_ChangeParticipants() -> *mut DartMessageKind {
    support::new_leak_box_ptr(DartMessageKind {
        ChangeParticipants: support::new_leak_box_ptr(wire_DartMessage_ChangeParticipants {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_DartMessage_React() -> *mut DartMessageKind {
    support::new_leak_box_ptr(DartMessageKind {
        React: support::new_leak_box_ptr(wire_DartMessage_React {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_DartMessage_Unsend() -> *mut DartMessageKind {
    support::new_leak_box_ptr(DartMessageKind {
        Unsend: support::new_leak_box_ptr(wire_DartMessage_Unsend {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_DartMessage_Edit() -> *mut DartMessageKind {
    support::new_leak_box_ptr(DartMessageKind {
        Edit: support::new_leak_box_ptr(wire_DartMessage_Edit {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_DartMessage_IconChange() -> *mut DartMessageKind {
    support::new_leak_box_ptr(DartMessageKind {
        IconChange: support::new_leak_box_ptr(wire_DartMessage_IconChange {
            field0: core::ptr::null_mut(),
        }),
    })
}

impl Default for wire_DartMessagePart {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartMessagePart {
    fn new_with_null_ptr() -> Self {
        Self {
            tag: -1,
            kind: core::ptr::null_mut(),
        }
    }
}

#[no_mangle]
pub extern "C" fn inflate_DartMessagePart_Text() -> *mut DartMessagePartKind {
    support::new_leak_box_ptr(DartMessagePartKind {
        Text: support::new_leak_box_ptr(wire_DartMessagePart_Text {
            field0: core::ptr::null_mut(),
        }),
    })
}

#[no_mangle]
pub extern "C" fn inflate_DartMessagePart_Attachment() -> *mut DartMessagePartKind {
    support::new_leak_box_ptr(DartMessagePartKind {
        Attachment: support::new_leak_box_ptr(wire_DartMessagePart_Attachment {
            field0: core::ptr::null_mut(),
        }),
    })
}

impl NewWithNullPtr for wire_DartMessageParts {
    fn new_with_null_ptr() -> Self {
        Self {
            field0: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_DartMessageParts {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartMMCSFile {
    fn new_with_null_ptr() -> Self {
        Self {
            signature: core::ptr::null_mut(),
            object: core::ptr::null_mut(),
            url: core::ptr::null_mut(),
            key: core::ptr::null_mut(),
            size: Default::default(),
        }
    }
}

impl Default for wire_DartMMCSFile {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartNormalMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            parts: Default::default(),
            body: core::ptr::null_mut(),
            effect: core::ptr::null_mut(),
            reply_guid: core::ptr::null_mut(),
            reply_part: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_DartNormalMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartReactMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            to_uuid: core::ptr::null_mut(),
            to_part: Default::default(),
            enable: Default::default(),
            reaction: Default::default(),
            to_text: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_DartReactMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartRenameMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            new_name: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_DartRenameMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_DartUnsendMessage {
    fn new_with_null_ptr() -> Self {
        Self {
            tuuid: core::ptr::null_mut(),
            edit_part: Default::default(),
        }
    }
}

impl Default for wire_DartUnsendMessage {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
