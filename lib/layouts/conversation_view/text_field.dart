import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:bluebubbles/action_handler.dart';
import 'package:bluebubbles/blocs/text_field_bloc.dart';
import 'package:bluebubbles/helpers/attachment_sender.dart';
import 'package:bluebubbles/helpers/hex_color.dart';
import 'package:bluebubbles/helpers/share.dart';
import 'package:bluebubbles/layouts/conversation_view/camera_widget.dart';
import 'package:bluebubbles/layouts/image_viewer/image_viewer.dart';
import 'package:bluebubbles/layouts/widgets/CustomCupertinoTextField.dart';
import 'package:bluebubbles/layouts/widgets/message_widget/message_content/media_players/audio_player_widget.dart';
import 'package:bluebubbles/managers/method_channel_interface.dart';
import 'package:bluebubbles/managers/outgoing_queue.dart';
import 'package:bluebubbles/managers/queue_manager.dart';
import 'package:bluebubbles/managers/settings_manager.dart';
import 'package:bluebubbles/repository/models/chat.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class BlueBubblesTextField extends StatefulWidget {
  final Chat chat;
  final Function customSend;
  final Function onSend;
  final List<File> existingAttachments;
  final String existingText;
  final Function saveText;
  BlueBubblesTextField({
    Key key,
    this.chat,
    this.customSend,
    this.existingAttachments,
    this.existingText,
    this.onSend,
    this.saveText,
  }) : super(key: key);

  @override
  _BlueBubblesTextFieldState createState() => _BlueBubblesTextFieldState();
}

class _BlueBubblesTextFieldState extends State<BlueBubblesTextField>
    with TickerProviderStateMixin {
  TextEditingController _controller;
  FocusNode _focusNode;
  List<AssetEntity> _images = <AssetEntity>[];
  bool showImagePicker = false;
  List<File> pickedImages = <File>[];
  List<Widget> _imageWidgets = <Widget>[];
  bool isRecording = false;
  static final GlobalKey<FormFieldState<String>> _searchFormKey =
      GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    super.initState();
    _controller = widget.chat != null
        ? TextFieldBloc().getTextField(widget.chat.guid)
        : new TextEditingController();
    if (widget.existingText != null) {
      _controller.text = widget.existingText;
    }
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showImagePicker = false;
        setState(() {});
      }
    });
    if (widget.existingAttachments != null) {
      pickedImages.addAll(widget.existingAttachments);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.chat == null) _controller.dispose();
    String dir = SettingsManager().appDocDir.path;
    Directory tempAssets = Directory("$dir/tempAssets");
    tempAssets.exists().then((value) {
      if (value) {
        tempAssets.delete(recursive: true);
      }
    });
    pickedImages = [];
    super.dispose();
  }

  Future<void> reviewAudio(BuildContext context, File file) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Theme.of(context).accentColor,
              title: new Text("Send it?",
                  style: Theme.of(context).textTheme.headline1),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Review your audio snippet before sending it",
                      style: Theme.of(context).textTheme.subtitle1),
                  Container(height: 10.0),
                  AudioPlayerWiget(file: file)
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                    child: new Text("Send",
                        style: Theme.of(context).textTheme.bodyText1),
                    onPressed: () {
                      OutgoingQueue().add(new QueueItem(
                          event: "send-attachment",
                          item: new AttachmentSender(
                            file,
                            widget.chat,
                            "",
                          )));

                      // Remove the OG alert dialog
                      Navigator.of(context).pop();
                    }),
                new FlatButton(
                    child: new Text("Discard",
                        style: Theme.of(context).textTheme.subtitle1),
                    onPressed: () {
                      file.delete();
                      Navigator.of(context).pop();
                    }),
              ]);
        });
  }

  Future<void> toggleShareMenu() async {
    // If the image picker is already open, close it, and return
    if (showImagePicker) {
      showImagePicker = !showImagePicker;
      setState(() {});
      return;
    }

    FocusScope.of(context).requestFocus(new FocusNode());
    if (await PhotoManager.requestPermission()) {
      List<AssetPathEntity> list =
          await PhotoManager.getAssetPathList(onlyAll: true);
      List<AssetEntity> images =
          await list.first.getAssetListRange(start: 0, end: 60);
      _images = images;
      showImagePicker = !showImagePicker;
      _imageWidgets = <Widget>[];

      _images.forEach((element) {
        _imageWidgets.add(
          FutureBuilder(
            future: element.thumbDataWithSize(800, 800, quality: 20),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Image.memory(
                      snapshot.data,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: element.type == AssetType.video
                              ? Icon(
                                  Icons.play_circle_filled,
                                  color: Colors.white.withOpacity(0.5),
                                  size: 50,
                                )
                              : Container(),
                          onTap: () async {
                            File image = await element.file;
                            for (int i = 0; i < pickedImages.length; i++) {
                              if (pickedImages[i].path == image.path) return;
                            }
                            pickedImages.add(image);
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox(
                  width: 100,
                  height: 100,
                );
              }
            },
          ),
        );
      });
      setState(() {});
    }
  }

  Future<File> _downloadFile(String url, String filename) async {
    HttpClient httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = SettingsManager().appDocDir.path;
    Directory tempAssets = Directory("$dir/tempAssets");
    if (!await tempAssets.exists()) {
      await tempAssets.create();
    }
    File file = new File('$dir/tempAssets/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    IconData rightIcon = Icons.arrow_upward;
    bool canRecord = _controller.text.isEmpty && pickedImages.length == 0;
    if (canRecord) rightIcon = Icons.mic;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedSize(
                  vsync: this,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: pickedImages.length > 0 ? 100 : 0,
                    ),
                    child: GridView.builder(
                      itemCount: pickedImages.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                      ),
                      itemBuilder: (context, int index) {
                        return Stack(
                          children: <Widget>[
                            mime(pickedImages[index].path).startsWith("video/")
                                ? FutureBuilder(
                                    future: VideoThumbnail.thumbnailData(
                                      video: pickedImages[index].path,
                                      imageFormat: ImageFormat.PNG,
                                      maxHeight: 100,
                                      quality: 25,
                                    ),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                              ConnectionState.done &&
                                          snapshot.hasData) {
                                        return Image.memory(snapshot.data,
                                            fit: BoxFit.fill);
                                      }
                                      return SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  )
                                : Hero(
                                    tag: pickedImages[index].path,
                                    child: FutureBuilder<Uint8List>(
                                      future:
                                          FlutterImageCompress.compressWithFile(
                                              pickedImages[index].absolute.path,
                                              quality: SettingsManager()
                                                      .settings
                                                      .lowMemoryMode
                                                  ? 5
                                                  : 10 // This is arbitrary
                                              ),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Image.memory(
                                            snapshot.data,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          );
                                        }
                                        return Container(
                                          height: 100,
                                          child: Center(
                                            child: LinearProgressIndicator(
                                              backgroundColor: Colors.grey,
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                Theme.of(context).primaryColor,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            mime(pickedImages[index].path).startsWith("video/")
                                ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: Colors.black,
                                ),
                                width: 25,
                                height: 25,
                                child: GestureDetector(
                                  onTap: () {
                                    File image = pickedImages[index];
                                    for (int i = 0;
                                        i < pickedImages.length;
                                        i++) {
                                      if (pickedImages[i].path == image.path) {
                                        pickedImages.removeAt(i);
                                        setState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 8.0),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: GestureDetector(
                          onTap: toggleShareMenu,
                          child: Icon(
                            Icons.share,
                            color: HexColor('8e8e8e'),
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Container(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: <Widget>[
                            AnimatedSize(
                              duration: Duration(milliseconds: 100),
                              vsync: this,
                              curve: Curves.easeInOut,
                              child: CustomCupertinoTextField(
                                onLongPressStart: () {
                                  Feedback.forLongPress(context);
                                },
                                onTap: () {
                                  HapticFeedback.selectionClick();
                                },
                                // autofocus: true,
                                key: _searchFormKey,
                                onChanged: (String value) {
                                  if (value.isEmpty && this.mounted) {
                                    setState(() {
                                      rightIcon = Icons.mic;
                                    });
                                  } else if (value.isNotEmpty &&
                                      rightIcon == Icons.mic &&
                                      this.mounted) {
                                    setState(() {
                                      rightIcon = Icons.arrow_upward;
                                    });
                                  }
                                },
                                onContentCommited: (String url) async {
                                  debugPrint("got attachment " + url);
                                  List<String> fnParts = url.split("/");
                                  fnParts = (fnParts.length > 2)
                                      ? fnParts.sublist(fnParts.length - 2)
                                      : fnParts.last;
                                  File file = await _downloadFile(
                                      url, fnParts.join("_"));
                                  pickedImages.add(file);
                                  setState(() {});
                                },
                                textCapitalization:
                                    TextCapitalization.sentences,
                                focusNode: _focusNode,
                                autocorrect: true,
                                controller: _controller,
                                scrollPhysics: BouncingScrollPhysics(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .apply(
                                        color: ThemeData
                                                    .estimateBrightnessForColor(
                                                        Theme.of(context)
                                                            .backgroundColor) ==
                                                Brightness.light
                                            ? Colors.black
                                            : Colors.white,
                                        fontSizeDelta: -0.25),
                                keyboardType: TextInputType.multiline,
                                maxLines: 14,
                                minLines: 1,
                                placeholder: "BlueBubbles",
                                padding: EdgeInsets.only(
                                    left: 10, top: 10, right: 40, bottom: 10),
                                placeholderStyle:
                                    Theme.of(context).textTheme.subtitle1,
                                autofocus:
                                    SettingsManager().settings.autoOpenKeyboard,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ButtonTheme(
                                minWidth: 30,
                                height: 30,
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                  ),
                                  color: Colors.blue,
                                  onPressed: () async {
                                    if (isRecording) {
                                      HapticFeedback.heavyImpact();
                                      Recording recording =
                                          await AudioRecorder.stop();
                                      setState(() {
                                        isRecording = false;
                                      });
                                      reviewAudio(
                                          context, new File(recording.path));
                                    } else if (canRecord &&
                                        !isRecording &&
                                        await Permission.microphone
                                            .request()
                                            .isGranted) {
                                      HapticFeedback.heavyImpact();
                                      String appDocPath =
                                          SettingsManager().appDocDir.path;
                                      String pathName =
                                          "$appDocPath/attachments/tmp.m4a";
                                      File file = new File(pathName);
                                      if (file.existsSync()) file.deleteSync();
                                      await AudioRecorder.start(
                                          path: pathName,
                                          audioOutputFormat:
                                              AudioOutputFormat.AAC);
                                      setState(() {
                                        isRecording = true;
                                      });
                                    } else if (widget.customSend != null) {
                                      widget.customSend(
                                          pickedImages, _controller.text);
                                    } else {
                                      if (pickedImages.length > 0) {
                                        for (int i = 0;
                                            i < pickedImages.length;
                                            i++) {
                                          OutgoingQueue().add(
                                            new QueueItem(
                                              event: "send-attachment",
                                              item: new AttachmentSender(
                                                pickedImages[i],
                                                widget.chat,
                                                i == pickedImages.length - 1
                                                    ? _controller.text
                                                    : "",
                                              ),
                                            ),
                                          );
                                        }
                                      } else {
                                        ActionHandler.sendMessage(
                                            widget.chat, _controller.text);
                                      }

                                      if (widget.onSend != null) {
                                        widget.onSend(_controller.text);
                                      }
                                    }

                                    _controller.text = "";
                                    pickedImages = <File>[];
                                    setState(() {});
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      AnimatedOpacity(
                                          opacity: _controller.text.isEmpty &&
                                                  pickedImages.length == 0
                                              ? 1.0
                                              : 0.0,
                                          duration: Duration(milliseconds: 150),
                                          child: Icon(Icons.mic,
                                              color: (isRecording)
                                                  ? Colors.red
                                                  : Colors.white,
                                              size: 20)),
                                      AnimatedOpacity(
                                          opacity:
                                              (_controller.text.isNotEmpty ||
                                                          pickedImages.length >
                                                              0) &&
                                                      !isRecording
                                                  ? 1.0
                                                  : 0.0,
                                          duration: Duration(milliseconds: 150),
                                          child: Icon(Icons.arrow_upward,
                                              color: Colors.white, size: 20)),
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: Duration(milliseconds: 100),
                  vsync: this,
                  curve: Curves.easeInOut,
                  child: showImagePicker
                      ? SizedBox(
                          child: CustomScrollView(
                            physics: AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            scrollDirection: Axis.horizontal,
                            slivers: <Widget>[
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 85,
                                        height: 80,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          onPressed: () async {
                                            String res =
                                                await MethodChannelInterface()
                                                    .invokeMethod("pick-image");
                                            if (res == null) return;
                                            File image = File(res);
                                            pickedImages.add(image);
                                            setState(() {});
                                          },
                                          color: Theme.of(context).accentColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.photo_library,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                ),
                                              ),
                                              Text(
                                                "Images",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 85,
                                        height: 80,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          onPressed: () async {
                                            String res =
                                                await MethodChannelInterface()
                                                    .invokeMethod("pick-video");
                                            if (res == null) return;
                                            File video = File(res);
                                            pickedImages.add(video);
                                            setState(() {});
                                          },
                                          color: Theme.of(context).accentColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.video_library,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                ),
                                              ),
                                              Text(
                                                "Videos",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 85,
                                        height: 80,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          onPressed: () async {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .accentColor,
                                                title: Text(
                                                  "Send Current Location?",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1,
                                                ),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    color: Colors.blue[600],
                                                    child: Text(
                                                      "Send",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    onPressed: () async {
                                                      Share.location(
                                                          widget.chat);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: Text(
                                                      "Cancel",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    color: Colors.red,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          color: Theme.of(context).accentColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                ),
                                              ),
                                              Text(
                                                "Location",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: CameraWidget(
                                  addAttachment: (File attachment) {
                                    pickedImages.add(attachment);
                                    setState(() {});
                                  },
                                ),
                              ),
                              SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    return _imageWidgets[index];
                                  },
                                  childCount: _imageWidgets.length,
                                ),
                              ),
                            ],
                          ),
                          height: 300,
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
