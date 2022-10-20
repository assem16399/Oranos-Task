import 'package:flutter/material.dart';

import '/core/styles/colors.dart';

class CheckedIcon extends StatelessWidget {
  const CheckedIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.check_circle, color: kElevatedButtonBGColor);
  }
}
