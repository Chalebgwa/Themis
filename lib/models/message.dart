import 'package:simon/models/user.dart';

enum MessageType { TEXT, GIF, IMAGE, VIDEO }

class Message {
  final String content;
  final String timestamp;
  final MessageType type;
  final String sender;
  final String reciever;

  Message(this.content, this.timestamp, this.type, this.sender, this.reciever);

  factory Message.fromMap(Map map) {
    var content = map["content"];
    var timestamp = map["timestamp"];
    var type = map["type"];
    var sender = map["sender"];
    var reciever = map["reciever"];

    return Message(content, timestamp, type, sender, reciever);
  }

  Map toMap() {
    return {
      "content":content,
      "timestamp":timestamp,
      "type":type,
      "sender":sender,
      "reciever":reciever
    };
  }
}
