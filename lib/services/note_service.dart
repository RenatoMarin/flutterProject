import 'dart:convert';
import 'package:flutterapi/models/api_response.dart';
import 'package:flutterapi/models/note.dart';
import 'package:flutterapi/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NoteService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': '76aa9fa3-bbdb-484e-b084-0aa8199b5a20'};

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
    return http.get(API + '/notes' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'Um erro aconteceu');
    }).catchError((_) => APIResponse<List<NoteForlisting>>(
        error: true, errorMessage: 'Um erro aconteceu'));
  }
}
