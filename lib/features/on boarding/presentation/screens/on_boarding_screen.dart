import 'package:flutter/material.dart';
import 'package:oranos/core/styles/colors.dart';

import '/features/on%20boarding/presentation/screens/get_started_screen.dart';
import '../widgets/ask_to_create_account.dart';
import '../widgets/centered_on_boarding_screen_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/on_board_image.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                const CenteredOnBoardingScreenText(),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 53.0,
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const GetStartedScreen()));
                          },
                          child: const Text('Get Started'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const AskToCreateAccount(),
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
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
