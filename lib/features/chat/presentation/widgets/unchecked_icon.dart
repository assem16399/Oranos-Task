import 'package:flutter/material.dart';

import '/core/styles/colors.dart';

class UncheckedIcon extends StatelessWidget {
  const UncheckedIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.circle,
      color: kBorderColor,
    );
  }
}
