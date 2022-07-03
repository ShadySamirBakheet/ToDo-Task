import 'package:drift/drift.dart';
import 'package:todo/core/data/data_sources/local_database/drift_database.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';

@UseRowClass(NotesModel)
class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 250)();
  TextColumn get note => text().withLength(min: 1, max: 250)();
  DateTimeColumn get timeNote => dateTime()();
}

class NotesModel extends Note with Insertable<NotesModel> {
  NotesModel({
    super.id,
    required super.timeNote,
    required super.title,
    required super.note,
  });

  factory NotesModel.fromJson(Map<String, dynamic>? json) {
    return NotesModel(
      id: json!['id'] as int?,
      title: json['title'] as String,
      note: json['note'] as String,
      timeNote: json['timeNote'] as DateTime,
    );
  }

  NotesModel copyWith({
    int? id,
    String? title,
    String? note,
    DateTime? timeNote,
  }) {
    return NotesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      timeNote: timeNote ?? this.timeNote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return NotesCompanion(
      id: id == null ? const Value.absent() : Value(id ?? 0),
      title: Value(title),
      note: Value(note),
      timeNote: Value(timeNote),
    ).toColumns(nullToAbsent);
  }
}
