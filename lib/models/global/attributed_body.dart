class AttributedBody {
  AttributedBody({
    required this.string,
    required this.runs,
  });

  final String string;
  final List<Run> runs;

  factory AttributedBody.fromMap(Map<String, dynamic> json) => AttributedBody(
    string: json["string"],
    runs: json["runs"] == null ? [] : List<Run>.from(json["runs"].map((x) => Run.fromMap(x!.cast<String, Object>()))),
  );

  Map<String, dynamic> toMap() => {
    "string": string,
    "runs": List<Map<String, dynamic>>.from(runs.map((x) => x.toMap())),
  };
}

class Run {
  Run({
    required this.range,
    this.attributes,
  });

  final List<int> range;
  final Attributes? attributes;

  bool get isAttachment => attributes?.attachmentGuid != null;
  bool get hasMention => attributes?.mention != null;

  factory Run.fromMap(Map<String, dynamic> json) => Run(
    range: json["range"] == null ? [] : List<int>.from(json["range"].map((x) => x)),
    attributes: json["attributes"] == null ? null : Attributes.fromMap(json["attributes"]!.cast<String, Object>()),
  );

  Map<String, dynamic> toMap() => {
    "range": range,
    "attributes": attributes?.toMap(),
  };
}

class Attributes {
  Attributes({
    this.messagePart,
    this.attachmentGuid,
    this.mention,
    this.stickerData,
  });

  final int? messagePart;
  final String? attachmentGuid;
  final String? mention;
  final StickerData? stickerData;

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
    messagePart: json["__kIMMessagePartAttributeName"],
    attachmentGuid: json["__kIMFileTransferGUIDAttributeName"],
    mention: json["__kIMMentionConfirmedMention"],
    stickerData: json["sticker"] != null ? StickerData.fromMap(json["sticker"]) : null,
  );

  Map<String, dynamic> toMap() => {
    "__kIMMessagePartAttributeName": messagePart,
    "__kIMFileTransferGUIDAttributeName": attachmentGuid,
    "__kIMMentionConfirmedMention": mention,
    "sticker": stickerData?.toMap()
  };
}

class StickerData {
    double msgWidth;
    double rotation;
    int sai;
    double scale;
    bool? update;
    int sli;
    double normalizedX;
    double normalizedY;
    int version;
    String hash;
    int safi;
    int effectType;
    String stickerId;

    StickerData({
        required this.msgWidth,
        required this.rotation,
        required this.sai,
        required this.scale,
        required this.update,
        required this.sli,
        required this.normalizedX,
        required this.normalizedY,
        required this.version,
        required this.hash,
        required this.safi,
        required this.effectType,
        required this.stickerId,
    });

    factory StickerData.fromMap(Map<String, dynamic> json) => StickerData(
        msgWidth: json["msgWidth"]?.toDouble(),
        rotation: json["rotation"]?.toDouble(),
        sai: json["sai"],
        scale: json["scale"]?.toDouble(),
        update: json["update"],
        sli: json["sli"],
        normalizedX: json["normalizedX"]?.toDouble(),
        normalizedY: json["normalizedY"]?.toDouble(),
        version: json["version"],
        hash: json["hash"],
        safi: json["safi"],
        effectType: json["effectType"],
        stickerId: json["stickerId"],
    );

    Map<String, dynamic> toMap() => {
        "msgWidth": msgWidth,
        "rotation": rotation,
        "sai": sai,
        "scale": scale,
        "update": update,
        "sli": sli,
        "normalizedX": normalizedX,
        "normalizedY": normalizedY,
        "version": version,
        "hash": hash,
        "safi": safi,
        "effectType": effectType,
        "stickerId": stickerId,
    };
}