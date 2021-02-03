import 'package:pjc_app/model/Artista.dart';

class Album {
  final int id;
  final String nome;
  final Artista artista;

  Album({this.id, this.nome, this.artista});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      nome: json['nome'],
      artista: Artista.fromJson(json['artista']),
    );
  }
}
