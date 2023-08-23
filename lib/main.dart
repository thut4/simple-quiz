import 'package:flutter/material.dart';
import 'package:flutter_quizzy/screen/splash_page.dart';

import 'screen/home_page.dart';

void main() {
  runApp(const ProApp());
}

class ProApp extends StatelessWidget {
  const ProApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      home: HomePage(),
    );
  }
}
