import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:pjc_app/values/UrlApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pjc_app/model/AccessTokenResponse.dart';

class AutenticacaoApi {
  Future<bool> autenticar(nome, senha) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var params = {
      "grant_type": "password",
      "username": nome,
      "password": md5.convert(utf8.encode(senha)).toString(),
    };

    var response = await http.post(UrlApi.url + "autenticacao/autenticar",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded; charset=utf-8"
        },
        body: params);

    if (response.statusCode == 200) {
      AccessTokenResponse resultado =
          AccessTokenResponse.fromJson(json.decode(response.body));
      prefs.setString("token", resultado.access_token);
      prefs.setString("login", nome);
      return Future<bool>.value(true);
    }

    return Future<bool>.value(false);
  }

  Future<String> buscarLoginUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("login");
  }
}
