import 'package:todo/modules/todo/data/models/todo_model.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';

abstract class ToDoLocalDataSource {
  Future<void> inserToDot(NotesModel todo);
  Future<void> updateToDo(NotesModel todo);
  Future<void> deleteToDo(Note todo);
  Future<void> deleteAll();

  Future<Note?> getToDo(int id);
  Future<List<Note>?> getListToDo();
}
