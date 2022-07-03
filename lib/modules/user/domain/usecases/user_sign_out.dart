import 'package:dartz/dartz.dart';
import 'package:todo/core/domain/usecases/use_case.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/user/domain/repositories/user_repository.dart';

class UserSignOut implements UseCase<void, NoParams> {
  UserSignOut({required this.repository});
  final UserRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams prams) {
    return repository.userSignOut();
  }
}
