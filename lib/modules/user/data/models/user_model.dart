import 'package:drift/drift.dart';
import 'package:todo/core/data/data_sources/local_database/drift_database.dart';
import 'package:todo/modules/user/data/models/user_model_cache.dart';
import 'package:todo/modules/user/domain/entities/user.dart';

@UseRowClass(UsersModel)
class Users extends Table {
  IntColumn get uid => integer().autoIncrement()();
  TextColumn get userName => text().withLength(min: 1, max: 250)();
  TextColumn get userEmail => text().withLength(min: 1, max: 250)();
  TextColumn get password => text().withLength(min: 1, max: 250)();
}

class UsersModel extends User
    with Insertable<UsersModel>
    implements UserModelCache {
  UsersModel({
    super.uid,
    required super.userName,
    required super.userEmail,
    required super.password,
  });

  factory UsersModel.fromJson(Map<String, dynamic>? json) {
    return UsersModel(
      uid: json!['uid'] as int?,
      password: json['password'] as String,
      userEmail: json['user_email'] as String,
      userName: json['user_name'] as String,
    );
  }

  UsersModel copyWith({
    int? uid,
    String? userEmail,
    String? userName,
    String? password,
  }) {
    return UsersModel(
      uid: uid ?? this.uid,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return UsersCompanion(
      uid: Value(uid ?? 0),
      userName: Value(userName),
      userEmail: Value(userEmail),
      password: Value(password),
    ).toColumns(nullToAbsent);
  }
}
