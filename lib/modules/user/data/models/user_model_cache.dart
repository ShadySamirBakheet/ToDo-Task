import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:todo/modules/user/domain/entities/user.dart';

class UserModelCache extends User {
  const UserModelCache({
    required super.uid,
    required super.userName,
    required super.userEmail,
    required super.password,
  });

  factory UserModelCache.fromJson(Map<String, dynamic> json) {
    return UserModelCache(
      uid: json['uid'] as int? ?? 0,
      password: json['password'] as String? ?? '',
      userEmail: json['user_email'] as String? ?? '',
      userName: json['user_name'] as String? ?? '',
    );
  }
}

class UserAdapter extends TypeAdapter<UserModelCache> {
  @override
  final typeId = 5;

  @override
  UserModelCache read(BinaryReader reader) {
    return UserModelCache.fromJson(
      json.decode(reader.readString()) as Map<String, dynamic>,
    );
  }

  @override
  void write(
    BinaryWriter writer,
    UserModelCache obj,
  ) {
    writer.writeString(json.encode(obj.toJson()));
  }
}
