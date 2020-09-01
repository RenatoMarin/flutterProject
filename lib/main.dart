import 'package:flutter/material.dart';
import 'package:flutterapi/services/note_service.dart';
import 'package:flutterapi/views/note_list.dart';
import 'package:get_it/get_it.dart';

//76aa9fa3-bbdb-484e-b084-0aa8199b5a20 API KEY

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NoteService());
}

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}
