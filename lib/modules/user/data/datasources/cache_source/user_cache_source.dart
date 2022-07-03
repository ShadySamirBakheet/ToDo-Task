import 'package:todo/modules/user/domain/entities/user.dart';

abstract class UserCacheSource {
  Future<User?> getCurrentUser();
  Future<void> saveCurrentUser(User user);
  Future<void> removeCurrentUser();
  Future<User?> updateCurrentUser(User user);

  ///Future<User?> userSignOut(User user);
}
