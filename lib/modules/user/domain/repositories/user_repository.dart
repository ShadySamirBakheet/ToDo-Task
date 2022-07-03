import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/user/data/models/user_model.dart';
import 'package:todo/modules/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> singUp(UsersModel user);
  Future<Either<Failure, bool>> updateUser(UsersModel user);
  Future<Either<Failure, User>> getProfile(int uid);
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, void>> userSignOut();
}
