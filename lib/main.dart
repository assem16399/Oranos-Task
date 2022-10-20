import 'package:flutter/material.dart';
import 'package:oranos/layout/app_layout.dart';

import 'core/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oranos Task',
      theme: kLightTheme,
      home: const AppLayout(),
    );
  }
}
