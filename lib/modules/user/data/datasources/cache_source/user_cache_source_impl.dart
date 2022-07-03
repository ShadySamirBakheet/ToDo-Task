import 'package:hive/hive.dart';

import 'package:todo/modules/user/data/datasources/cache_source/user_cache_source.dart';
import 'package:todo/modules/user/data/models/user_model_cache.dart';
import 'package:todo/modules/user/domain/entities/user.dart';

class UserCacheSourceImpl implements UserCacheSource {
  @override
  Future<User?> getCurrentUser() async {
    final box = await _userBox;

    print('box.get("currentUser") ${box.get('currentUser')}');
    return box.get('currentUser');
  }

  @override
  Future<void> saveCurrentUser(User user) async {
    final box = await _userBox;
    await box.clear();
    await box.put('currentUser', user);
  }

  @override
  Future<User?> updateCurrentUser(User user) async {
    final box = await _userBox;
    await box.clear();
    await box.put('currentUser', user);

    return box.get('currentUser');
  }

  Future<Box<User>> get _userBox {
    return Hive.openBox<UserModelCache>('userBox');
  }

  @override
  Future<void> removeCurrentUser() async {
    await (await _userBox).clear();
  }
}
