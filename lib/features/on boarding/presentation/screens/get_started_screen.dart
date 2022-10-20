import 'package:flutter/material.dart';
import 'package:oranos/features/chat/presentation/screens/chat_bot_screen.dart';

import '/core/styles/colors.dart';
import '../widgets/bot_introduction_text.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Expanded(
                flex: 3,
                child: FittedBox(
                  child: BotIntroductionText(),
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.asset('assets/images/robot_image.png'),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 53.0,
                child: FractionallySizedBox(
                  widthFactor: 0.37,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatBotScreen()));
                      },
                      child: const Text('Next')),
                ),
              ),
              const SizedBox(height: 50),
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
