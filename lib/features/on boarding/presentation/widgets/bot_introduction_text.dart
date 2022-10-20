import 'package:flutter/material.dart';

class BotIntroductionText extends StatelessWidget {
  const BotIntroductionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 20.0),
            child: Image.asset('assets/images/strange_image.png'),
          ),
          Positioned.fill(
            bottom: 60,
            right: 20,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 'Hi, My name is ',
                      style: Theme.of(context).textTheme.headline5),
                  TextSpan(
                      text: 'Oranobot',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: ' will always be there to help and assist you. \n',
                      style: Theme.of(context).textTheme.headline5),
                  TextSpan(
                      text: 'Say',
                      style: Theme.of(context).textTheme.headline5),
                  TextSpan(
                      text: ' Oranobot',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: ' To go to Next.',
                      style: Theme.of(context).textTheme.headline5),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
