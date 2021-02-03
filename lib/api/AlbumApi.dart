import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pjc_app/model/Album.dart';
import 'package:pjc_app/values/UrlApi.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AlbumApi {
  Future<List<Album>> listarAlbuns(
      String nome, int quantidade, int pagina) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = "Bearer " + prefs.getString("token");
    final response = await http.get(
      UrlApi.url +
          'album/listar?nome=' +
          nome +
          '&quantidade=' +
          quantidade.toString() +
          '&pagina=' +
          pagina.toString(),
      headers: {HttpHeaders.authorizationHeader: token},
    );
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}
