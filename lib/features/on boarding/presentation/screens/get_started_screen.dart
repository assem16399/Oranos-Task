import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const BotIntroductionText(),
          const Spacer(),
          SizedBox(
            height: 53.0,
            child: FractionallySizedBox(
              widthFactor: 0.4,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Next')),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.language),
              Text(
                ' English',
                style: TextStyle(
                  fontSize: 15,
                  color: kSecondaryColor,
                  // TODO add FbSans Regular
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}

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
