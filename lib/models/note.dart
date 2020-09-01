class Note {
  String noteID;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime latesEditDateTime;

  Note(
      {this.noteID,
      this.noteTitle,
      this.noteContent,
      this.createDateTime,
      this.latesEditDateTime});

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      noteContent: item['noteContent'],
      createDateTime: DateTime.parse(item['createDateTime']),
      latesEditDateTime: item['latesEditDateTime'] != null
          ? DateTime.parse(item['latesEditDateTime'])
          : null,
    );
  }
}
