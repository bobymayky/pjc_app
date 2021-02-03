import 'package:pjc_app/api/AutenticacaoApi.dart';
import 'package:pjc_app/screens/base/MyHomePage.dart';
import 'package:pjc_app/values/Imagens.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String tag = 'login-page';
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 29.0, left: 16.0, right: 16.0),
            height: double.infinity,
            decoration: new BoxDecoration(color: Colors.white),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  _buildLogoImage(),
                  _builTextBemVindo(),
                  _builTextFormFieldEmail(),
                  _builTextFormFieldPassWord(),
                  _builLoginButton(context),
                  //
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLogoImage() {
    return Container(
      padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
      height: 100,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(Imagens.TELA_LOGIN_LOGO),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _builTextBemVindo() {
    return new Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Seja Bem Vindo", style: TextStyle(color: Colors.black)),
            ]));
  }

  Widget _builTextFormFieldEmail() {
    return new Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: _tLogin,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.blue,
          ),
          hintText: "Digite seu login",
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: new BorderSide(color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: new BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  void buscarLoginUsuario() async {
    String retorno = (await AutenticacaoApi().buscarLoginUsuario());
    _tLogin.text = (retorno != null ? retorno.toString() : "");
  }

  Widget _builTextFormFieldPassWord() {
    return new Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: _tSenha,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.blue,
          ),
          hintText: "Digite sua senha",
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: new BorderSide(color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: new BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  Widget _builLoginButton(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        SizedBox(
          height: 50.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () {
              realizarLogin(context);
            },
            padding: EdgeInsets.all(0.0),
            color: Colors.blue,
            child: Text('Entrar', style: TextStyle(color: Colors.white)),
          ),
        ),
      ]),
    );
  }

  void realizarLogin(BuildContext context) async {
    final login = _tLogin.text.trim();
    final senha = _tSenha.text.trim();

    bool autenticou = await (AutenticacaoApi().autenticar(login, senha));
    if (autenticou) {
      Navigator.of(context).pushNamed(MyHomePage.tag);
    } else {
      showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Aviso"),
      content: Text("Não foi possivel conectar verifique seu usuário e senha."),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
