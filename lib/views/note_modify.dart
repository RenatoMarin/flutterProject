import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapi/models/note_insert.dart';
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

  //MANIPULADOR DE TEXTOS
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    //SOMENTE SE ESTIVER EDITANDO UMA NOTA PODERÁ VER A EDIÇÃO
    if (isEditing) {
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
                      height: 35,
                      child: RaisedButton(
                        child: Text('Enviar',
                            style: TextStyle(color: Colors.white)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () async {
                          if (isEditing) {
                            //Update notas na API
                          } else {
                            setState(() {
                              _isLoading = true;
                            });

                            final note = NoteInsert(
                                noteTitle: _titleController.text,
                                noteContent: _contentController.text);
                            final result = await noteService.createNote(note);

                            setState(() {
                              _isLoading = false;
                            });

                            final title = 'Note window';
                            final text = result.error
                                ? (result.errorMessage ?? 'Um erro aconteceu')
                                : 'Sua nota foi criada';

                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text(title),
                                      content: Text(text),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    )).then((data) {
                              if (result.data) {
                                Navigator.of(context).pop();
                              }
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
        ));
  }
}
