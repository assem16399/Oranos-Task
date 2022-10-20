import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key? key,
    required this.maxWidth,
    required this.msgText,
  }) : super(key: key);

  final double maxWidth;
  final String msgText;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 48, maxWidth: maxWidth * 0.7 - 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Text(msgText),
        ),
      ),
    );
  }
}
