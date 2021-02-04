import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pjc_app/api/AlbumApi.dart';

class ImagePrincipalAlbum extends StatefulWidget {
  int idAlbum;

  ImagePrincipalAlbum({Key key, @required this.idAlbum}) : super(key: key);

  @override
  ImagePrincipalAlbumState createState() => ImagePrincipalAlbumState();
}

class ImagePrincipalAlbumState extends State<ImagePrincipalAlbum> {
  String base64String;
  @override
  Widget build(BuildContext context) {
    if (base64String != null) {
      Uint8List profile = base64.decode(base64String);
      return new Image.memory(
        profile,
        width: 80,
        height: 50,
      );
    }
    return ClipOval();
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  getImage() async {
    final String retorno = await AlbumApi().buscarCapaAlbum(widget.idAlbum);
    setState(() {
      base64String = retorno;
    });
  }
}
