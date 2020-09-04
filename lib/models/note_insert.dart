import 'package:flutter/foundation.dart';

class NoteInsert {
  String noteTitle;
  String noteContent;

  NoteInsert({@required this.noteTitle, @required this.noteContent});

  //CONVERTER A NOTA EM UM MAPA DE STRING E DYNAMIC
  Map<String, dynamic> toJson() {
    return {
      //noteTitle e noteContent é uma chava para o MAP
      "noteTitle": noteTitle,
      "noteContent": noteContent
    };
  }
}
