import 'package:dartz/dartz.dart';
import 'package:todo/core/domain/usecases/use_case.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/todo/data/models/todo_model.dart';
import 'package:todo/modules/todo/domain/repositories/todo_repository.dart';

class UpdateNoteCase implements UseCase<void, NotesModel> {
  UpdateNoteCase({required this.repository});
  final ToDoRepository repository;

  @override
  Future<Either<Failure, void>> call(NotesModel params) {
    return repository.updateToDo(params);
  }
}
