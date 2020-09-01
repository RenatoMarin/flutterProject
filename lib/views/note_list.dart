import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterapi/models/note_for_listing.dart';
import 'package:flutterapi/views/note_modify.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new NoteForlisting(
        noteID: "1",
        createDateTime: DateTime.now(),
        latesEditDateTime: DateTime.now(),
        noteTitle: "Nota 1"),
    new NoteForlisting(
        noteID: "1",
        createDateTime: DateTime.now(),
        latesEditDateTime: DateTime.now(),
        noteTitle: "Nota 2"),
    new NoteForlisting(
        noteID: "1",
        createDateTime: DateTime.now(),
        latesEditDateTime: DateTime.now(),
        noteTitle: "Nota 3"),
  ];

  //Formatar a data para DD/MM/AAAA
  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de recados')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(
              notes[index].noteTitle,
              style: TextStyle(
                  color: Theme.of(context)
                      .primaryColor), //Se for trocado a cor primaria, será trocado a primaryColor também
            ),
            subtitle: Text(
                'Editado em ${formatDateTime(notes[index].latesEditDateTime)}'),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
