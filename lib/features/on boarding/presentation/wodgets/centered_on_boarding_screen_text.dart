import 'package:flutter/material.dart';

class CenteredOnBoardingScreenText extends StatelessWidget {
  const CenteredOnBoardingScreenText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'FacebookSans',
              ),
              children: [
                TextSpan(
                  text: 'Oranos',
                  style: TextStyle(fontSize: 40),
                ),
                TextSpan(
                    text: '.',
                    style: TextStyle(color: Color(0xff16919B), fontSize: 50)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Expert From Every Planet',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600, color: const Color(0xff5F5F5F)),
          )
        ],
      ),
    );
  }
}
