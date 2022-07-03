import 'package:drift/drift.dart';
import 'package:todo/core/data/data_sources/local_database/drift_database.dart';
import 'package:todo/modules/todo/data/datasources/local_datasource/todo_local_datasource.dart';
import 'package:todo/modules/todo/data/models/todo_model.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';

part 'todo_local_datasource_impl.g.dart';

@DriftAccessor(tables: [Notes])
class ToDoLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with _$ToDoLocalDataSourceImplMixin
    implements ToDoLocalDataSource {
  ToDoLocalDataSourceImpl(super.attachedDatabase);

  @override
  Future<void> deleteAll() => delete(notes).go();

  @override
  Future<void> deleteToDo(Note note) =>
      (delete(notes)..where((c) => c.id.equals(note.id))).go();

  @override
  @override
  Future<List<Note>?> getListToDo() => select(notes).get();

/* ..orderBy([
          (u) => OrderingTerm(expression: u.timeNote, mode: OrderingMode.desc),
          (u) => OrderingTerm(expression: u.id)
        ]) */

  @override
  Future<Note?> getToDo(int id) =>
      (select(notes)..where((note) => note.id.equals(id))).getSingle();

  @override
  Future<void> inserToDot(NotesModel note) => batch(
        (batch) => batch.insert(
          notes,
          note,
          mode: InsertMode.insertOrAbort,
        ),
      );

  @override
  Future<void> updateToDo(NotesModel note) => update(notes).replace(note);
}
