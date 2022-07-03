import 'package:dartz/dartz.dart';

import 'package:todo/core/domain/usecases/use_case.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/user/data/models/user_model.dart';
import 'package:todo/modules/user/domain/entities/user.dart';
import 'package:todo/modules/user/domain/repositories/user_repository.dart';

class LoginUser implements UseCase<User, UserLoginPrams> {
  LoginUser({required this.repository});
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(UserLoginPrams prams) {
    if (prams.isLogin) {
      return repository.login(
        email: prams.user.userEmail,
        password: prams.user.password,
      );
    } else {
      return repository.singUp(prams.user);
    }
  }
}

class UserLoginPrams {
  UserLoginPrams({
    required this.user,
    required this.isLogin,
  });
  final UsersModel user;
  final bool isLogin;
}
