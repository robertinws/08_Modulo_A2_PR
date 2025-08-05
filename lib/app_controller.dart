import 'package:flutter/material.dart';
import 'package:modulo_a2_pr/pages/splash_page.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => SplashPage()},
    );
  }
}
