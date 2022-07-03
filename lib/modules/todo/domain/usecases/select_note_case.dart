import 'package:dartz/dartz.dart';
import 'package:todo/core/domain/usecases/use_case.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/todo/domain/entities/todo.dart';
import 'package:todo/modules/todo/domain/repositories/todo_repository.dart';

class SelectNoteCase implements UseCase<Note, int> {
  SelectNoteCase({required this.repository});
  final ToDoRepository repository;

  @override
  Future<Either<Failure, Note>> call(int params) {
    return repository.getToDo(params);
  }
}
