import 'package:flutter/cupertino.dart';
import 'package:modulo_a2_pr/global/variaveis.dart';

void logout() async {
  await methodChannel.invokeMethod('salvarToken', [' ']);
  await methodChannel.invokeMethod('mantenhaConectado', [false]);
  usuario = '';
  mantenhaConectado = false;
  Navigator.of(contexto!).pushReplacementNamed('/login');
}
