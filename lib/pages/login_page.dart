import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulo_a2_pr/global/cores.dart';
import 'package:modulo_a2_pr/global/variaveis.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', senha = '';
  TextEditingController emailController = TextEditingController(),
      senhaController = TextEditingController();

  void validarLogin() async {
    email = emailController.text.toString().trim();
    senha = senhaController.text.toString().trim();
    int tipoErroTalvez = 0;

    if (!email.contains("@") || !email.contains(".")) {
      tipoErroTalvez = 1;
    }

    if (tipoErroTalvez == 0) {
    } else {
      switch (tipoErroTalvez) {
        case 1:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
      SystemUiMode.manual,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: corEscuro,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: corClara),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: corClara),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Senha',
                      ),
                    ),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Checkbox(
                        value: mantenhaConectado,
                        onChanged: (value) {
                          setState(() {
                            mantenhaConectado = value!;
                          });
                        },
                      ),
                      Text('Manhtenha-me conectado'),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: corRoxoMedio,
                        foregroundColor: corClara,
                      ),
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
