import 'dart:convert';
import 'dart:io';

import 'package:modulo_a2_pr/global/variaveis.dart';

class InfosDao {
  Future<void> validarLogin(String email, String senha) async {
    try {
      final HttpClient client = HttpClient();
      final HttpClientRequest request = await client.postUrl(
        Uri.parse(
          'https://workspace.dinizeotecnologia.com.br/worldskills/A2/generate_token',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        'application/json; charset=utf-8',
      );
      request.write(jsonEncode({'email': email, 'password': senha}));
      final HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        String resposta = await response
            .transform(utf8.decoder)
            .join();
        token = jsonDecode(resposta)['token'];
        await methodChannel.invokeMethod('salvarToken', [token]);
        usuario = jsonDecode(
          await methodChannel.invokeMethod('token', [token]),
        );
      } else {
        print('Error ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> receberMensagem() async {
    try {
      final HttpClient client = HttpClient();
      final HttpClientRequest request = await client.getUrl(
        Uri.parse(
          'https://workspace.dinizeotecnologia.com.br/worldskills/A2/motd',
        ),
      );
      final HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        String jsonResponse = await response
            .transform(utf8.decoder)
            .join();
        mensagemHome = jsonDecode(jsonResponse)['MOTD'];
      } else {
        print('Error ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
