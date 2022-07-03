import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/modules/user/data/datasources/cache_source/user_cache_source.dart';
import 'package:todo/modules/user/data/datasources/local_datasource/user_local_datasource.dart';
import 'package:todo/modules/user/data/models/user_model.dart';
import 'package:todo/modules/user/data/models/user_model_cache.dart';
import 'package:todo/modules/user/domain/entities/user.dart';
import 'package:todo/modules/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.cacheSource,
    required this.localDataSource,
  });
  final UserCacheSource cacheSource;
  final UserLocalDataSource localDataSource;

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await cacheSource.getCurrentUser();
      if (user != null) {
        return Right(user);
      }
      return Left(CacheFailure());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getProfile(int uid) async {
    final user = await localDataSource.getProfile(uid);
    if (user != null) {
      return Right(user);
    }
    return Left(CacheFailure());
  }

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await localDataSource.login(email, password);
      if (user != null) {
        await cacheSource.saveCurrentUser(user as UserModelCache);
        print('user $user');
        return Right(user);
      }
      return Left(CacheFailure());
    } catch (e) {
      print('login Error $e');

      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, User>> singUp(UsersModel user) async {
    try {
      await localDataSource.singUp(user);

      final userLogined = await localDataSource.getUser(user.userEmail);

      if (userLogined != null) {
        await cacheSource.saveCurrentUser(userLogined as UserModelCache);
        return Right(user);
      }
      return Left(CacheFailure());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateUser(UsersModel user) async {
    try {
      await cacheSource.updateCurrentUser(user);
      final val = await localDataSource.updateUser(user);
      if (val) {
        return Right(val);
      }
      return Left(DatabaseFailure(error: 'Error'));
    } catch (e) {
      return Left(DatabaseFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> userSignOut() async {
    try {
      return Right(await cacheSource.removeCurrentUser());
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
