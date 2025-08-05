import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulo_a2_pr/pages/escolas_page.dart';
import 'package:modulo_a2_pr/pages/home_page.dart';
import 'package:modulo_a2_pr/pages/login_page.dart';
import 'package:modulo_a2_pr/pages/splash_page.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/escolas': (context) => EscolasPage(),
      },
    );
  }
}
