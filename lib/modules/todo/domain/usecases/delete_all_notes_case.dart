import 'package:dartz/dartz.dart';
import 'package:todo/core/domain/usecases/use_case.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/todo/domain/repositories/todo_repository.dart';

class DeleteAllNoteCase implements UseCase<void, NoParams> {
  DeleteAllNoteCase({required this.repository});
  final ToDoRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.deleteAll();
  }
}
