import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pjc_app/api/AlbumApi.dart';

class ImageAlbum extends StatefulWidget {
  int idAlbum;

  ImageAlbum({Key key, @required this.idAlbum}) : super(key: key);

  @override
  ImageAlbumState createState() => ImageAlbumState();
}

class ImageAlbumState extends State<ImageAlbum> {
  String base64String;
  @override
  Widget build(BuildContext context) {
    if (base64String != null) {
      Uint8List profile = base64.decode(base64String);
      return new Image.memory(
        profile,
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
