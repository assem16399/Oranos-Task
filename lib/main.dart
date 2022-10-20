import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos/features/chat/presentation/screens/chat_bot_screen.dart';

import '/features/chat/logic/messages_cubit.dart';
import 'core/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MessagesCubit>(create: (context) => MessagesCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oranos Task',
        theme: kLightTheme,
        home: const ChatBotScreen(),
      ),
    );
  }
}
