import 'package:drift/drift.dart';
import 'package:todo/core/data/data_sources/local_database/drift_database.dart';
import 'package:todo/modules/user/data/datasources/local_datasource/user_local_datasource.dart';
import 'package:todo/modules/user/data/models/user_model.dart';
import 'package:todo/modules/user/domain/entities/user.dart';

part 'user_local_datasource_impl.g.dart';

@DriftAccessor(tables: [Users])
class UserLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with _$UserLocalDataSourceImplMixin
    implements UserLocalDataSource {
  UserLocalDataSourceImpl(super.attachedDatabase);

  @override
  Future<User?> getProfile(int uid) =>
      (select(users)..where((user) => user.uid.equals(uid))).getSingle();

  @override
  Future<User?> login(String email, String password) async {
    final user = await (select(users)
          ..where((user) => user.userEmail.equals(email)))
        .getSingle();

    if (user.password == password) {
      return user;
    }
    return null;
  }

  @override
  Future<bool> updateUser(UsersModel user) => update(users).replace(user);

  @override
  Future singUp(UsersModel user) async {
    await batch((batch) {
      batch.insert(
        users,
        user,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<User?> getUser(String email) =>
      (select(users)..where((user) => user.userEmail.equals(email)))
          .getSingle();
}
