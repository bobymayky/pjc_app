import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pjc_app/model/Artista.dart';
import 'package:pjc_app/values/UrlApi.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ArtistaApi {
  Future<List<Artista>> listarArtistas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = "Bearer " + prefs.getString("token");
    final response = await http.get(
      UrlApi.url + '/api/artista/listar/nome',
      headers: {HttpHeaders.authorizationHeader: token},
    );
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Artista>((json) => Artista.fromJson(json)).toList();
  }
}
