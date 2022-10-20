import 'package:flutter/material.dart';

import '/core/styles/colors.dart';

class AskToCreateAccount extends StatelessWidget {
  const AskToCreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: 'Don\'t have an account? ',
              style: Theme.of(context).textTheme.caption),
          const TextSpan(
            text: 'SignUp',
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: kElevatedButtonBGColor),
          )
        ],
      ),
    );
  }
}
