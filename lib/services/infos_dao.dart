import 'dart:convert';
import 'dart:io';

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
        String token = jsonDecode(resposta)['token'];
      } else {
        print('Error ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
