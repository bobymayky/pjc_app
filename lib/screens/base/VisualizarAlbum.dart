import 'package:flutter/material.dart';
import 'package:pjc_app/componentes/ImageAlbum.dart';
import 'package:pjc_app/model/Album.dart';

class VisualizarAlbum extends StatefulWidget {
  Album album;

  VisualizarAlbum({Key key, @required this.album}) : super(key: key);

  static String tag = 'visualizar-album-page';
  @override
  _VisualizarAlbumState createState() => new _VisualizarAlbumState();
}

class _VisualizarAlbumState extends State<VisualizarAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Expanded(child: new Text("Visualizar Album")),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Card(
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                ImageAlbum(idAlbum: widget.album.id),
                _buscarNomeArtista(widget.album),
                _buscarNomeAlbum(widget.album)
              ],
            )),
          ],
        ),
      ),
    );
  }
}

Widget _buscarNomeArtista(Album album) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            album.artista.nome,
            maxLines: 2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 10.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget _buscarNomeAlbum(Album album) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
    child: Row(
      children: <Widget>[
        Expanded(
            child: Text(
          album.nome,
          style: TextStyle(fontSize: 12.0),
        ))
      ],
    ),
  );
}
