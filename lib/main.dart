import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pjc_app/screens/base/MyHomePage.dart';
import 'package:pjc_app/screens/login/LoginPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MyHomePage.tag: (context) => MyHomePage(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
