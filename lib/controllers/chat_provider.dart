import 'package:flutter/material.dart';
import 'package:simon/models/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> _messages = [];
  List<Message> get messages => _messages.reversed.toList();

  Future<List<Message>> getChat(String recieverId, String senderId) async {
    return _messages;
  }

  Future<void> addMessage(
    String reciever,
    String sender,
    String content,
    MessageType type,
  ) async {
    final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
    final message = Message(content, timestamp, type, sender, reciever);
    _messages.insert(0, message);
    notifyListeners();
  }
}
