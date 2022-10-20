import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class HomeListTitle extends StatelessWidget {
  const HomeListTitle(
      {Key? key, required this.title, required this.onMorePressed})
      : super(key: key);

  final String title;
  final Function() onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        IconButton(
            onPressed: onMorePressed,
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: kSideInfoColor,
            )),
      ],
    );
  }
}
