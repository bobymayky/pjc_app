import 'package:flutter/material.dart';

class TextPesquisa extends StatefulWidget {
  TextPesquisa(this._sendDescricao);

  Function(String) _sendDescricao;

  @override
  _TextPesquisaState createState() => _TextPesquisaState();
}

class _TextPesquisaState extends State<TextPesquisa> {
  bool _isComposing = true;

  final TextEditingController _controller = TextEditingController();

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration.collapsed(
                hintText: "Pesquisar por nome artista ou album"),
            onChanged: (text) {
              setState(() {
                //_isComposing = text.isNotEmpty;
              });
            },
            onSubmitted: (text) {
              widget._sendDescricao(text);
              // _reset();
            },
          )),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: _isComposing
                  ? () {
                      widget._sendDescricao(_controller.text);
                      // _reset();
                    }
                  : null)
        ],
      ),
    );
  }
}
