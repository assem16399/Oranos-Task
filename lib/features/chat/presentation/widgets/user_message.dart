import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'message_container.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({Key? key, required this.maxWidth, required this.msgText})
      : super(key: key);
  final double maxWidth;

  final String msgText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MessageContainer(maxWidth: maxWidth, msgText: msgText),
        const SizedBox(width: 10),
        SvgPicture.asset('assets/icons/seen_Icon.svg')
      ],
    );
  }
}
