import 'package:flutter/material.dart';
import 'package:pjc_app/api/AlbumApi.dart';
import 'package:pjc_app/componentes/TextPesquisa.dart';
import 'package:pjc_app/model/Album.dart';

class ListarAlbum extends StatefulWidget {
  String nome;
  ListarAlbum({Key key, @required this.nome}) : super(key: key);

  @override
  ListarAlbumState createState() => ListarAlbumState();
}

class ListarAlbumState extends State<ListarAlbum> {
  Future<List<Album>> _albuns;
  String nome = "";
  int quantidade = 5;
  int pagina = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _pesquisarAlbum(),
          _buscarAlbuns(),
        ],
      ),
    );
  }

  Widget _pesquisarAlbum() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: TextPesquisa((text) {
        nome = text;
        refreshList();
      }),
    );
  }

  Widget _buscarAlbuns() {
    return new Expanded(
        child: FutureBuilder<List<Album>>(
      future: _albuns,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    ));
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Album> albuns = snapshot.data;
    return new ListView.builder(
      itemCount: albuns.length,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          color: Colors.black12,
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.all(2),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        _buscarNomeArtista(albuns[index]),
                        _buscarNomeAlbum(albuns[index])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
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
            maxLines: 20,
            style: TextStyle(fontSize: 12.0),
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _albuns = _listarAlbuns(nome, quantidade, pagina);
  }

  void refreshList() {
    setState(() {
      _albuns = _listarAlbuns(nome, quantidade, pagina);
    });
  }

  Future<List<Album>> _listarAlbuns(
      String nome, int quantidade, int pagina) async {
    return AlbumApi().listarAlbuns(nome, quantidade, pagina);
  }
}
