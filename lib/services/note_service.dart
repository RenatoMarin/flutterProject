import 'dart:convert';
import 'package:flutterapi/models/api_response.dart';
import 'package:flutterapi/models/note.dart';
import 'package:flutterapi/models/note_for_listing.dart';
import 'package:flutterapi/models/note_insert.dart';
import 'package:http/http.dart' as http;

class NoteService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {
    'apiKey': '76aa9fa3-bbdb-484e-b084-0aa8199b5a20',
    'Content-Type': 'application/json'
  };

  // UPPER CLASS APIResponse
  //GET
  Future<APIResponse<List<NoteForlisting>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForlisting>[];
        for (var item in jsonData) {
          notes.add(NoteForlisting.fromJson(item));
        }
        return APIResponse<List<NoteForlisting>>(data: notes);
      }
      return APIResponse<List<NoteForlisting>>(
          error: true, errorMessage: 'Um erro aconteceu');
    }).catchError((_) => APIResponse<List<NoteForlisting>>(
        error: true, errorMessage: 'Um erro aconteceu'));
  }

  //GET MÉTODO
  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(API + '/notes/' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'Um erro aconteceu');
    }).catchError((_) =>
        APIResponse<Note>(error: true, errorMessage: 'Um erro aconteceu'));
  }

  //POST BOOL Para indicar se foi bem sucedido ou não
  Future<APIResponse<bool>> createNote(NoteInsert item) {
    return http
        //Json.encode vai converter o MAP para Json
        .post(API + '/notes',
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'Um erro aconteceu');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'Um erro aconteceu'));
  }
}
