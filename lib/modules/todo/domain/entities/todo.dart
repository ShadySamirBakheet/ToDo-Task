class Note {
  Note({
    this.id,
    required this.title,
    required this.note,
    required this.timeNote,
  });
  final int? id;
  final String title;
  final String note;
  final DateTime timeNote;
}
