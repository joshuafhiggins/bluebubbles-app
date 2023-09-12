
import 'package:async_task/async_task_extension.dart';
import 'package:bluebubbles/ffi.dart';
import 'package:bluebubbles/helpers/helpers.dart';
import 'package:bluebubbles/models/models.dart';
import 'package:bluebubbles/services/rustpush/rustpush_socket_service.dart';
import 'package:bluebubbles/services/services.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';
import 'package:tuple/tuple.dart';
import '../network/backend_service.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
RustPushService pushService = Get.isRegistered<RustPushService>() ? Get.find<RustPushService>() : Get.put(RustPushService());

// utils for communicating between dart and rustpush.
class RustPushBBUtils {
  static Handle rustHandleToBB(String handle) {
    var address = handle.replaceAll("tel:", "").replaceAll("mailto:", "");
    var mHandle = Handle.findOne(addressAndService: Tuple2(address, "iMessage"));
    if (mHandle == null) {
      mHandle = Handle.fromMap({
        "address": handle.replaceAll("tel:", "").replaceAll("mailto:", "")
      });
      mHandle.save();
    }
    return mHandle;
  }

  static Future<String> formatAddress(String e) async {
    return e.isEmail ? e : await api.formatE164(number: e, country: countryCode ?? "US");
  }

  static Future<String> formatAndAddPrefix(String e) async {
    var address = await formatAddress(e);
    if (address.isEmail) {
      return "mailto:$address";
    } else {
      return "tel:$address";
    }
  }

  static String bbHandleToRust(Handle handle) {
    var address = handle.address;
    if (address.isEmail) {
      return "mailto:$address";
    } else {
      return "tel:$address";
    }
  }

  static Future<List<Handle>> rustParticipantsToBB(List<String> participants) async {
    var myHandles = (await api.getHandles(state: pushService.state));
    return participants.filter((e) => !myHandles.contains(e)).map((e) => rustHandleToBB(e)).toList();
  }
}

class RustPushBackend implements BackendService {

  @override
  Future<Map<String, dynamic>> createChat(List<String> addresses, String? message, String service, {CancelToken? cancelToken}) async {
    var chat = Chat.fromMap({
      "guid": uuid.v4(),
      "participants": (await Future.wait(addresses.map((e) async => {
        "address": await RustPushBBUtils.formatAddress(e),
        "service": service
      }))).toList()
    });
    if (message != null) {
      var msg = await api.newMsg(
        state: pushService.state,
        conversation: chat.getConversationData(),
        message: DartMessage.message(DartNormalMessage(
          parts: DartMessageParts(field0: [DartIndexedMessagePart(field0: DartMessagePart.text(message))], bridge: api)
        ))
      );
      await api.send(state: pushService.state, msg: msg);
      msg.sentTimestamp = DateTime.now().millisecondsSinceEpoch;

      chat.save(); //save for reflectMessage
      final newMessage = Message.fromMap(await pushService.reflectMessage(msg));
      newMessage.chat.target = chat;
      newMessage.save();
    }
    return chat.toMap();
  }

  @override
  Future<Map<String, dynamic>?> downloadAttachment(String guid, {void Function(int p1, int p2)? onReceiveProgress, bool original = false, CancelToken? cancelToken}) async {
    var attachment = Attachment.findOne(guid);
    var rustAttachment = await DartAttachment.restore(bridge: api, saved: attachment!.metadata!["rustpush"]);
    var stream = api.downloadAttachment(state: pushService.state, attachment: rustAttachment, path: attachment.path);
    await for (final event in stream) {
      if (onReceiveProgress != null) {
        onReceiveProgress(event.prog, event.total);
      }
    }
    return {
      "data": null
    };
  }

  @override
  Future<Map<String, dynamic>?> sendAttachment(String chatGuid, String tempGuid, PlatformFile file, {void Function(int p1, int p2)? onSendProgress, String? method, String? effectId, String? subject, String? selectedMessageGuid, int? partIndex, bool? isAudioMessage, CancelToken? cancelToken}) async {
    var tempAttachment = Attachment.findOne(tempGuid)!;
    var stream = api.uploadAttachment(state: pushService.state, path: file.path!, mime: tempAttachment.mimeType ?? "application/octet-stream", uti: tempAttachment.uti ?? "public.data", name: tempAttachment.transferName!);
    DartAttachment? attachment;
    await for (final event in stream) {
      if (event.attachment != null) {
        print("upload finish");
        attachment = event.attachment;
      } else if (onSendProgress != null) {
        print("upload progress ${event.prog} of ${event.total}");
        onSendProgress(event.prog, event.total);
      }
    }
    print("uploaded");
    var chat = Chat.findOne(guid: chatGuid)!;
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: chat.getConversationData(),
      message: DartMessage.message(DartNormalMessage(
        parts: DartMessageParts(field0: [DartIndexedMessagePart(field0: DartMessagePart.attachment(attachment!))], bridge: api),
        replyGuid: selectedMessageGuid,
        replyPart: selectedMessageGuid == null ? null : "$partIndex:0:0",
        effect: effectId,
      ))
    );
    await api.send(state: pushService.state, msg: msg);
    msg.sentTimestamp = DateTime.now().millisecondsSinceEpoch;
    return await pushService.reflectMessage(msg);
  }

  @override
  bool canCancelUploads() {
    return false;
  }

  @override
  Future<bool> canUploadGroupPhotos() async {
    return true;
  }

  @override
  Future<bool> setChatIcon(String guid, String path, {void Function(int p1, int p2)? onSendProgress, CancelToken? cancelToken}) async {
    var chat = Chat.findOne(guid: guid)!;
    var mmcsStream = api.uploadMmcs(state: pushService.state, path: path);
    DartMMCSFile? mmcs;
    await for (final event in mmcsStream) {
      if (event.file != null) {
        print("upload finish");
        mmcs = event.file;
      } else if (onSendProgress != null) {
        print("upload progress ${event.prog} of ${event.total}");
        onSendProgress(event.prog, event.total);
      }
    }
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: chat.getConversationData(),
      message: DartMessage.iconChange(DartIconChangeMessage(file: mmcs!))
    );
    await api.send(state: pushService.state, msg: msg);
    return true;
  }
  
  @override
  Future<Map<String, dynamic>> sendMessage(String chatGuid, String tempGuid, String message, {String? method, String? effectId, String? subject, String? selectedMessageGuid, int? partIndex, CancelToken? cancelToken}) async {
    var chat = Chat.findOne(guid: chatGuid)!;
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: chat.getConversationData(),
      message: DartMessage.message(DartNormalMessage(
        parts: DartMessageParts(field0: [DartIndexedMessagePart(field0: DartMessagePart.text(message))], bridge: api),
        replyGuid: selectedMessageGuid,
        replyPart: selectedMessageGuid == null ? null : "$partIndex:0:0",
        effect: effectId,
      ))
    );
    await api.send(state: pushService.state, msg: msg);
    msg.sentTimestamp = DateTime.now().millisecondsSinceEpoch;
    return await pushService.reflectMessage(msg);
  }


  Future<bool> markDelivered(DartIMessage message) async {
    // all messages with c = 100 need to be acked
    if (!(message.message is DartMessage_React || message.message is DartMessage_Message || message.message is DartMessage_Typing)) {
      return true;
    }
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: message.conversation!,
      message: const DartMessage.delivered()
    );
    msg.id = message.id;
    await api.send(state: pushService.state, msg: msg);
    return true;
  }
  
  @override
  Future<bool> markRead(String chatGuid) async {
    var chat = Chat.findOne(guid: chatGuid)!;
    var latestMsg = chat.latestMessage.guid;
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: chat.getConversationData(),
      message: const DartMessage.read()
    );
    msg.id = latestMsg!;
    await api.send(state: pushService.state, msg: msg);
    return true;
  }

  @override
  Future<bool> renameChat(String chatGuid, String newName) async {
    var chat = Chat.findOne(guid: chatGuid)!;
    var data = chat.getConversationData();
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: data,
      message: DartMessage.renameMessage(DartRenameMessage(newName: newName))
    );
    await api.send(state: pushService.state, msg: msg);
    msg.sentTimestamp = DateTime.now().millisecondsSinceEpoch;
    inq.queue(IncomingItem.fromMap(QueueType.newMessage, await pushService.reflectMessage(msg)));
    return true;
  }

  @override
  Future<bool> chatParticipant(String method, String chatGuid, String newName) async {
    var chat = Chat.findOne(guid: chatGuid)!;
    var data = chat.getConversationData();
    var newParticipants = data.participants.copy();
    if (method == "add") {
      var target = await RustPushBBUtils.formatAndAddPrefix(newName);
      var valid = (await api.validateTargets(state: pushService.state, targets: [target])).isNotEmpty;
      if (!valid) {
        return false;
      }
      newParticipants.add(target);
    } else if (method == "remove") {
      newParticipants.remove(await RustPushBBUtils.formatAndAddPrefix(newName));
    }
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: data,
      message: DartMessage.changeParticipants(DartChangeParticipantMessage(newParticipants: newParticipants))
    );
    await api.send(state: pushService.state, msg: msg);
    msg.sentTimestamp = DateTime.now().millisecondsSinceEpoch;
    inq.queue(IncomingItem.fromMap(QueueType.newMessage, await pushService.reflectMessage(msg)));
    return true;
  }

  @override
  Future<bool> leaveChat(String chatGuid) async {
    var chat = Chat.findOne(guid: chatGuid)!;
    var myHandles = (await api.getHandles(state: pushService.state)).map((e) => RustPushBBUtils.rustHandleToBB(e));
    var handle = myHandles.firstWhere((element) => chat.handles.contains(element));
    return await chatParticipant("remove", chatGuid, handle.address);
  }

  var reactionMap = {
    ReactionTypes.LOVE: DartReaction.Heart,
    ReactionTypes.LIKE: DartReaction.Like,
    ReactionTypes.DISLIKE: DartReaction.Dislike,
    ReactionTypes.LAUGH: DartReaction.Laugh,
    ReactionTypes.EMPHASIZE: DartReaction.Emphsize,
    ReactionTypes.QUESTION: DartReaction.Question
  };

  @override
  Future<Map<String, dynamic>> sendTapback(String chatGuid, String selectedText, String selectedGuid, String reaction, int? repPart) async {
    var chat = Chat.findOne(guid: chatGuid)!;
    var enabled = !reaction.startsWith("-");
    reaction = enabled ? reaction : reaction.substring(1);
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: chat.getConversationData(),
      message: DartMessage.react(DartReactMessage(
        toUuid: selectedGuid,
        toPart: repPart ?? 0,
        toText: selectedText,
        enable: enabled,
        reaction: reactionMap[reaction]!
      ))
    );
    await api.send(state: pushService.state, msg: msg);
    msg.sentTimestamp = DateTime.now().millisecondsSinceEpoch;
    return await pushService.reflectMessage(msg);
  }

  @override
  Future<Map<String, dynamic>?> unsend(String msgGuid, int part) async {
    var msgObj = Message.findOne(guid: msgGuid)!;
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: msgObj.chat.target!.getConversationData(),
      message: DartMessage.unsend(DartUnsendMessage(tuuid: msgGuid, editPart: part))
    );
    await api.send(state: pushService.state, msg: msg);
    var map = msgObj.toMap();
    var summaryInfo = msgObj.messageSummaryInfo.firstOrNull;
    map["dateEdited"] = DateTime.now().millisecondsSinceEpoch;
    map["messageSummaryInfo"] = [
      {
        "retractedParts": [part, ...(summaryInfo?.retractedParts ?? [])],
        "editedContent": summaryInfo?.editedContent ?? {},
        "originalTextRange": summaryInfo?.originalTextRange ?? {},
        "editedParts": summaryInfo?.editedParts ?? []
      }
    ];
    return map;
  }

  @override
  Future<Map<String, dynamic>?> edit(String msgGuid, String text, int part) async {
    var msgObj = Message.findOne(guid: msgGuid)!;
    var msg = await api.newMsg(
      state: pushService.state,
      conversation: msgObj.chat.target!.getConversationData(),
      message: DartMessage.edit(DartEditMessage(tuuid: msgGuid, editPart: part, 
          newParts: DartMessageParts(field0: [DartIndexedMessagePart(field0: DartMessagePart.text(text), field1: part)], bridge: api)))
    );
    await api.send(state: pushService.state, msg: msg);
    msg.sentTimestamp = DateTime.now().millisecondsSinceEpoch;
    return await pushService.reflectMessage(msg);
  }

  @override
  HttpService? getRemoteService() {
    return null;
  }

  @override
  bool canLeaveChat() {
    return true;
  }

  @override
  bool canEditUnsend() {
    return true;
  }
}

class RustPushService extends GetxService {
  late PushState state;

  Map<String, DartAttachment> attachments = {};

  var invReactionMap = {
    DartReaction.Heart: ReactionTypes.LOVE,
    DartReaction.Like: ReactionTypes.LIKE,
    DartReaction.Dislike: ReactionTypes.DISLIKE,
    DartReaction.Laugh: ReactionTypes.LAUGH,
    DartReaction.Emphsize: ReactionTypes.EMPHASIZE,
    DartReaction.Question: ReactionTypes.QUESTION,
  };

  Future<Map<String, dynamic>> indexedPartsToAttributedBody(List<DartIndexedMessagePart> parts, String? attachmentGuid, Map<String, dynamic>? existingBody) async {
    var bodyString = "";
    var body = existingBody?["runs"] ?? [];
    var attachments = [];
    for (var indexedParts in parts) {
      var parts = indexedParts.field0;
      var fieldIdx = indexedParts.field1 ?? body.length;
      // remove old elements
      body.removeWhere((element) => 
        element["attributes"]["__kIMMessagePartAttributeName"] == fieldIdx
      );
      if (parts is DartMessagePart_Text) {
        body.add({
          "range": [bodyString.length, parts.field0.length],
          "attributes": {
            "__kIMBaseWritingDirectionAttributeName": -1,
            "__kIMMessagePartAttributeName": fieldIdx
          }
        });
        bodyString += parts.field0;
      } else if (parts is DartMessagePart_Attachment) {
        var myUuid = attachmentGuid ?? uuid.v4();
        attachments.add({
          "guid": myUuid,
          "uti": parts.field0.utiType,
          "mimeType": parts.field0.mime,
          "isOutgoing": false,
          "transferName": parts.field0.name,
          "totalBytes": parts.field0.size,
          "metadata": {
            "rustpush": await parts.field0.save()
          }
        });
        body.add({
          "range": [bodyString.length, 1],
          "attributes": {
            "__kIMFileTransferGUIDAttributeName": myUuid,
            "__kIMBaseWritingDirectionAttributeName": -1,
            "__kIMMessagePartAttributeName": body.length
          }
        });
        bodyString += " ";
      }
    }
    return {
      "body": [{
        "string": bodyString,
        "runs": body
      }],
      "string": bodyString,
      "attachments": attachments
    };
  }

  Future<Map<String, dynamic>> reflectMessage(DartIMessage myMsg, {String? attachmentGuid}) async {
    var chat = myMsg.conversation != null ? await Chat.findByRust(myMsg.conversation!) : null;
    var myHandles = (await api.getHandles(state: pushService.state));
    if (myMsg.message is DartMessage_Message) {
      var innerMsg = myMsg.message as DartMessage_Message;

      var attributedBodyData = await indexedPartsToAttributedBody(innerMsg.field0.parts.field0, attachmentGuid, null);

      return {
        "guid": myMsg.id,
        "text": attributedBodyData["string"],
        "isFromMe": myHandles.contains(myMsg.sender),
        "handle": RustPushBBUtils.rustHandleToBB(myMsg.sender!).toMap(),
        "chats": [
          chat!.toMap()
        ],
        "dateCreated": myMsg.sentTimestamp,
        "threadOriginatorPart": innerMsg.field0.replyPart?.toString(),
        "threadOriginatorGuid": innerMsg.field0.replyGuid,
        "expressiveSendStyleId": innerMsg.field0.effect,
        "attributedBody": attributedBodyData["body"],
        "attachments": attributedBodyData["attachments"]
      };
    } else if (myMsg.message is DartMessage_IconChange) {
      var innerMsg = myMsg.message as DartMessage_IconChange;
      var path = chat!.getIconPath(innerMsg.field0.file.size);
      var stream = api.downloadMmcs(state: pushService.state, attachment: innerMsg.field0.file, path: path);
      await for (final event in stream) {
        print("Downloaded attachment ${event.prog} bytes of ${event.total}");
      }
      chat.customAvatarPath = path;
      chat.save(updateCustomAvatarPath: true);
      return {
        "guid": myMsg.id,
        "isFromMe": myHandles.contains(myMsg.sender),
        "handle": RustPushBBUtils.rustHandleToBB(myMsg.sender!).toMap(),
        "chats": [
          chat.toMap()
        ],
        "dateCreated": myMsg.sentTimestamp,
        "itemType": 3,
        "groupActionType": 1,
      };
    } else if (myMsg.message is DartMessage_RenameMessage) {
      var msg = myMsg.message as DartMessage_RenameMessage;
      return {
        "guid": myMsg.id,
        "isFromMe": myHandles.contains(myMsg.sender),
        "handle": RustPushBBUtils.rustHandleToBB(myMsg.sender!).toMap(),
        "chats": [
          chat!.toMap()
        ],
        "dateCreated": myMsg.sentTimestamp,
        "itemType": 2,
        "groupActionType": 2,
        "groupTitle": msg.field0.newName
      };
    } else if (myMsg.message is DartMessage_ChangeParticipants) {
      var msg = myMsg.message as DartMessage_ChangeParticipants;
      var isAdd = msg.field0.newParticipants.length > chat!.participants.length;
      var participantHandles = await RustPushBBUtils.rustParticipantsToBB(msg.field0.newParticipants);
      var changed = isAdd ?
        participantHandles.firstWhere((element) => chat!.participants.none((p0) => p0.address == element.address)) :
        chat.participants.firstWhere((element) => participantHandles.none((p0) => p0.address == element.address));
      chat.handles.clear();
      chat.handles.addAll(participantHandles);
      chat.handles.applyToDb();
      chat = chat.getParticipants();
      chat.save();
      return {
        "guid": myMsg.id,
        "isFromMe": myHandles.contains(myMsg.sender),
        "handle": RustPushBBUtils.rustHandleToBB(myMsg.sender!).toMap(),
        "chats": [
          chat.toMap()
        ],
        "dateCreated": myMsg.sentTimestamp,
        "itemType": 1,
        "groupActionType": isAdd ? 0 : 1,
        "otherHandle": changed.originalROWID,
      };
    } else if (myMsg.message is DartMessage_React) {
      var msg = myMsg.message as DartMessage_React;
      var reaction = invReactionMap[msg.field0.reaction]!;
      if (!msg.field0.enable) {
        reaction = "-$reaction";
      }
      return {
        "guid": myMsg.id,
        "isFromMe": myHandles.contains(myMsg.sender),
        "handle": RustPushBBUtils.rustHandleToBB(myMsg.sender!).toMap(),
        "chats": [
          chat!.toMap()
        ],
        "dateCreated": myMsg.sentTimestamp,
        "itemType": 1,
        "associatedMessagePart": msg.field0.toPart,
        "associatedMessageGuid": msg.field0.toUuid,
        "associatedMessageType": reaction,
      };
    } else if (myMsg.message is DartMessage_Edit) {
      var msg = myMsg.message as DartMessage_Edit;
      var msgObj = Message.findOne(guid: msg.field0.tuuid);
      if (msgObj == null) {
        throw Exception("Cannot find msg!");
      }
      var map = msgObj.toMap();
      var summaryInfo = msgObj.messageSummaryInfo.firstOrNull;
      var parts = summaryInfo?.editedParts ?? [];
      if (!parts.contains(msg.field0.editPart)) {
        parts.add(msg.field0.editPart);
      }
      var attributedBodyDataInclusive = await indexedPartsToAttributedBody(msg.field0.newParts.field0, attachmentGuid, msgObj.attributedBody.map((e) => e.toMap()).toList().firstOrNull);
      var attributedBodyEdited = await indexedPartsToAttributedBody(msg.field0.newParts.field0, attachmentGuid, null);
      map["text"] = attributedBodyDataInclusive["string"];
      map["dateEdited"] = DateTime.now().millisecondsSinceEpoch;
      map["chats"] = [
        msgObj.chat.target!.toMap()
      ];
      Map<String, List<Map<String, dynamic>>> editedContentMap = msgObj.messageSummaryInfo.firstOrNull?.toJson()["editedContent"] ?? {};
      editedContentMap[msg.field0.editPart.toString()] = [
        ...(editedContentMap[msg.field0.editPart.toString()] ?? [{
          "date": (msgObj.dateCreated?.millisecondsSinceEpoch ?? 0).toDouble(),
          "text": {
            "values": [
              {
                "string": msgObj.text,
                "runs": [
                  {
                    "range": [
                      0,
                      msgObj.text?.length ?? 0
                    ],
                    "attributes": {
                        "__kIMMessagePartAttributeName": msg.field0.editPart,
                        "__kIMFileTransferGUIDAttributeName": null,
                        "__kIMMentionConfirmedMention": null
                    }
                  }
                ]
              }
            ]
          }
        }]),
        {
          "date": myMsg.sentTimestamp.toDouble(),
          "text": {
            "values": attributedBodyEdited["body"]
          }
        },
      ];
      map["attributedBody"] = attributedBodyDataInclusive["body"];
      map["messageSummaryInfo"] = [
        {
          "retractedParts": summaryInfo?.retractedParts ?? [],
          "editedContent": editedContentMap,
          "originalTextRange": summaryInfo?.originalTextRange ?? [
            0,
            msgObj.text?.length ?? 0
          ],
          "editedParts": parts
        }
      ];
      return map;
    }
    throw Exception("bad message type!");
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    api.newPushState();
    state = await api.newPushState();
    if (ss.settings.rustPushState.value != "") {
      await api.restore(currState: state, data: ss.settings.rustPushState.value);
    } else {
      await api.newPush(state: state);
    }
    (socket as RustPushSocketService).doPoll();
  }

  @override
  void onClose() {
    state.dispose();
    super.onClose();
  }
}