
import 'package:async_task/async_task_extension.dart';
import 'package:bluebubbles/ffi.dart';
import 'package:bluebubbles/models/models.dart';
import 'package:bluebubbles/services/network/backend_service.dart';
import 'package:bluebubbles/services/rustpush/rustpush_service.dart';
import 'package:bluebubbles/services/services.dart';
import 'package:bluebubbles/utils/logger.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class RustPushSocketService extends GetxService implements SocketService {
  @override
  Rx<SocketState> state = SocketState.connected.obs;
  
  @override
  void disconnect() {}
  
  @override
  void forgetConnection() {}
  
  @override
  void reconnect() {}
  
  @override
  void restartSocket() {}

  @override
  void onInit() {
    super.onInit();
    pushService; // hello! init us
  }

  void doPoll() async {
    while (true) {
      var msg = await api.recvWait(state: pushService.state);
      if (msg == null) {
        continue;
      }
      if (msg is DartRecievedMessage_Message) {
        var myMsg = msg.msg;
        if (myMsg.message is DartMessage_RenameMessage) {
          var msg = myMsg.message as DartMessage_RenameMessage;
          var chat = await Chat.findByRust(myMsg.conversation!);
          chat.displayName = msg.field0.newName;
          chat = chat.save(updateDisplayName: true);
        }
        if (myMsg.message is DartMessage_Delivered || myMsg.message is DartMessage_Read) {
          var message = Message.findOne(guid: myMsg.id);
          if (message == null) {
            continue;
          }
          var map = message.toMap();
          map["chats"] = [
            message.chat.target!.toMap()
          ];
          if (myMsg.message is DartMessage_Delivered) {
            map["dateDelivered"] = myMsg.sentTimestamp;
          } else {
            map["dateRead"] = myMsg.sentTimestamp;
          }
          inq.queue(IncomingItem.fromMap(QueueType.updatedMessage, map));
          continue;
        }
        if (myMsg.message is DartMessage_Typing) {
          var chat = await Chat.findByRust(myMsg.conversation!);
          final controller = cvc(chat);
          controller.showTypingIndicator.value = true;
          var future = Future.delayed(const Duration(minutes: 1));
          var subscription = future.asStream().listen((any) {
            controller.showTypingIndicator.value = false;
            controller.cancelTypingIndicator = null;
          });
          controller.cancelTypingIndicator = subscription;
          continue;
        }
        if (myMsg.message is DartMessage_StopTyping) {
          var chat = await Chat.findByRust(myMsg.conversation!);
          final controller = cvc(chat);
          controller.showTypingIndicator.value = false;
          if (controller.cancelTypingIndicator != null) {
            controller.cancelTypingIndicator!.cancel();
            controller.cancelTypingIndicator = null;
          }
          continue;
        }
        if (myMsg.message is DartMessage_Message) {
          var chat = await Chat.findByRust(myMsg.conversation!);
          final controller = cvc(chat);
          controller.showTypingIndicator.value = false;
          controller.cancelTypingIndicator?.cancel();
          controller.cancelTypingIndicator = null;
          var msg = myMsg.message as DartMessage_Message;
          if (await msg.field0.parts.asPlain() == "" && msg.field0.parts.field0.none((p0) => p0.field0 is DartMessagePart_Attachment)) {
            continue;
          }
        }
        var service = backend as RustPushBackend;
        service.markDelivered(myMsg);
        inq.queue(IncomingItem.fromMap(QueueType.newMessage, await pushService.reflectMessage(myMsg)));
      }
    }
  }
  
  @override
  void startedTyping(String chatGuid) async {
    var chat = Chat.findOne(guid: chatGuid)!;
    if (chat.participants.length > 1) {
      return; // no typing indicators for multiple chats
    }
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: chat.getConversationData(),
      message: const DartMessage.typing()
    );
    await api.send(state: pushService.state, msg: msg);
  }
  
  @override
  void stoppedTyping(String chatGuid) async {
    var chat = Chat.findOne(guid: chatGuid)!;
    if (chat.participants.length > 1) {
      return; // no typing indicators for multiple chats
    }
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: chat.getConversationData(),
      message: const DartMessage.stopTyping()
    );
    await api.send(state: pushService.state, msg: msg);
  }
  
  @override
  void updateTypingStatus(String chatGuid) {
    // not much to do here
  }
}