import 'package:todo/modules/user/data/models/user_model.dart';
import 'package:todo/modules/user/domain/entities/user.dart';

abstract class UserLocalDataSource {
  Future<User?> login(String email, String password);
  Future singUp(UsersModel user);
  Future<bool> updateUser(UsersModel user);
  Future<User?> getProfile(int uid);
  Future<User?> getUser(String email);
}
