import 'package:dartz/dartz.dart';
import 'package:todo/core/domain/usecases/use_case.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/user/domain/entities/user.dart';
import 'package:todo/modules/user/domain/repositories/user_repository.dart';

class CheckUserAuth implements UseCase<User, NoParams> {
  CheckUserAuth({required this.repository});
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(NoParams prams) {
    return repository.getCurrentUser();
  }
}
