import 'package:flutter/material.dart';

import 'bot_message.dart';
import 'user_message.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.text,
    required this.isMe,
    required this.maxWidth,
  }) : super(key: key);

  final bool isMe;
  final String text;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (isMe) UserMessage(maxWidth: maxWidth, msgText: text),
        if (!isMe) BotMessage(maxWidth: maxWidth, msgText: text)
      ],
    );
  }
}
