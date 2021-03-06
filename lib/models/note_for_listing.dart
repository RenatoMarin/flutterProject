class NoteForlisting {
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime latesEditDateTime;

  NoteForlisting(
      {this.noteID,
      this.noteTitle,
      this.createDateTime,
      this.latesEditDateTime});

  factory NoteForlisting.fromJson(Map<String, dynamic> item) {
    return NoteForlisting(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      createDateTime: DateTime.parse(item['createDateTime']),
      latesEditDateTime: item['latesEditDateTime'] != null
          ? DateTime.parse(item['latesEditDateTime'])
          : null,
    );
  }
}
