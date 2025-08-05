import 'package:flutter/services.dart';

bool mantenhaConectado = false;
String caminhoCanal = 'com.example.modulo_a2_pr';
MethodChannel methodChannel = MethodChannel('$caminhoCanal/main');
