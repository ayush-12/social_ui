import 'package:meta/meta.dart';

class ChatModel {
  String sendBy;
  String message;

  ChatModel({
    @required this.sendBy,
    @required this.message,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      sendBy: json['sendBy'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sendBy': sendBy,
      'message': message,
    };
  }
}
