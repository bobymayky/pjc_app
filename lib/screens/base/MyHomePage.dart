import 'package:flutter/material.dart';
import 'package:pjc_app/componentes/ListarAlbum.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  static String tag = 'my-home-page';
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Expanded(child: new Text("Album")),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListarAlbum(nome: ""),
    );
  }
}
