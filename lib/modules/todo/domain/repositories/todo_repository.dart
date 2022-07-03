import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/todo/data/models/todo_model.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';

abstract class ToDoRepository {
  Future<Either<Failure, void>> inserToDot(NotesModel todo);
  Future<Either<Failure, void>> updateToDo(NotesModel todo);
  Future<Either<Failure, void>> deleteToDo(Note todo);
  Future<Either<Failure, void>> deleteAll();

  Future<Either<Failure, Note>> getToDo(int id);
  Future<Either<Failure, List<Note>>> getListToDo();
}
