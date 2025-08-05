import 'package:flutter/services.dart';

bool mantenhaConectado = false;
String caminhoCanal = 'com.example.modulo_a2_pr';
MethodChannel methodChannel = MethodChannel('$caminhoCanal/main');
EventChannel eventInternet = EventChannel('$caminhoCanal/internet');
String token = '';
bool conexaoInternet = false;
dynamic usuario = '';
String mensagemHome = '';
