import 'package:dartz/dartz.dart';

import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/todo/data/datasources/local_datasource/todo_local_datasource.dart';
import 'package:todo/modules/todo/data/models/todo_model.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';
import 'package:todo/modules/todo/domain/repositories/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  ToDoRepositoryImpl({
    required this.localDataSource,
  });
  final ToDoLocalDataSource localDataSource;

  @override
  Future<Either<Failure, void>> deleteAll() async {
    try {
      return Right(await localDataSource.deleteAll());
    } catch (e) {
      return Left(DatabaseFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteToDo(Note todo) async {
    try {
      return Right(await localDataSource.deleteToDo(todo));
    } catch (e) {
      return Left(DatabaseFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getListToDo() async {
    try {
      final notes = await localDataSource.getListToDo();
      if (notes != null && notes.isNotEmpty) {
        return Right(notes);
      }

      return Left(EmptyFailure());
    } catch (e) {
      return Left(DatabaseFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Note>> getToDo(int id) async {
    try {
      final todo = await localDataSource.getToDo(id);
      if (todo != null) {
        return Right(todo);
      }

      return Left(EmptyFailure());
    } catch (e) {
      return Left(DatabaseFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> inserToDot(NotesModel todo) async {
    try {
      return Right(await localDataSource.inserToDot(todo));
    } catch (e) {
      return Left(DatabaseFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateToDo(NotesModel todo) async {
    return Right(await localDataSource.updateToDo(todo));
    // try {

    // } catch (e) {
    //   return Left(DatabaseFailure(error: e.toString()));
    // }
  }
}
