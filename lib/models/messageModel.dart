// ignore: camel_case_types
class messageModel {
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdon;

  messageModel({this.sender, this.text, this.seen, this.createdon});

  messageModel.fromMap(Map<String, dynamic> map) {
    sender = map["sender"];
    text = map["text"];
    seen = map["seen"];
    createdon = map["createdon"].toDate();
  }

  Map<String, dynamic> toMAp() {
    return {
      "sender": sender,
      "text": text,
      "seen": seen,
      "createdon": createdon
    };
  }
}
