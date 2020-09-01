import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Atenção'),
      content: Text('Você tem certeza que quer deletar essa nota?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Sim'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('Não'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        )
      ],
    );
  }
}
