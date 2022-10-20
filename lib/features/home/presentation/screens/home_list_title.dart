import 'package:flutter/material.dart';
import 'package:oranos/core/styles/colors.dart';

class HomeListTitle extends StatelessWidget {
  const HomeListTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommended Experts',
          style: Theme.of(context).textTheme.headline6,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: kSideInfoColor,
            )),
      ],
    );
  }
}
