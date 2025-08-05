import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool entrada = false;

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    await Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        entrada = true;
      });
    });
    await Future.delayed(Duration(milliseconds: 2500), () {
      setState(() {
        entrada = false;
      });
    });
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      overlays: [],
      SystemUiMode.manual,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Center(
            child: AnimatedOpacity(
              opacity: entrada ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,

              child: Image.asset(
                height: 150,
                'assets/images/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
