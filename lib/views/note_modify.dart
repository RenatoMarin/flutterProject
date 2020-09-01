import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String noteID;
  bool get isEditing => noteID != null;

  NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(isEditing ? 'Editar nota' : 'Criar notas')),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Título da Nota'),
              ),
              Container(height: 8),
              TextField(
                decoration: InputDecoration(hintText: 'Conteúdo da Nota'),
              ),
              Container(height: 16),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Enviar', style: TextStyle(color: Colors.white)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (isEditing) {
                      //Update notas na API
                    } else {
                      //Create notas na API
                    }
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
