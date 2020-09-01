import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapi/services/note_service.dart';
import 'package:flutterapi/models/note.dart';
import 'package:get_it/get_it.dart';

class NoteModify extends StatefulWidget {
  final String noteID;
  NoteModify({this.noteID});

  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteID != null;

  NoteService get noteService => GetIt.I<NoteService>();

  String errorMessage;
  Note note;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    noteService.getNote(widget.noteID).then((response) {
      setState(() {
        _isLoading = false;
      });
      if (response.error) {
        errorMessage = response.errorMessage ?? 'Um erro ocorreu';
      }
      note = response.data;
      _titleController.text = note.noteTitle;
      _contentController.text = note.noteContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(isEditing ? 'Editar nota' : 'Criar notas')),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(hintText: 'Título da Nota'),
                    ),
                    Container(height: 8),
                    TextField(
                      controller: _contentController,
                      decoration: InputDecoration(hintText: 'Conteúdo da Nota'),
                    ),
                    Container(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text('Enviar',
                            style: TextStyle(color: Colors.white)),
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
