import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'message_container.dart';

class BotMessage extends StatelessWidget {
  const BotMessage({Key? key, required this.maxWidth, required this.msgText})
      : super(key: key);

  final double maxWidth;
  final String msgText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: SvgPicture.asset('assets/icons/chat_bot_icon.svg'),
        ),
        const SizedBox(width: 10),
        MessageContainer(
          maxWidth: maxWidth,
          msgText: msgText,
        )
      ],
    );
  }
}
