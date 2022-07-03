import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.uid,
    required this.userEmail,
    required this.userName,
    required this.password,
  });
  final int? uid;
  final String userEmail;
  final String userName;
  final String password;

  Map<String, Object?> toJson() {
    return {
      'id': uid,
      'user_name': userName,
      'user_email': userEmail,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [
        uid,
        userEmail,
        userName,
        password,
      ];
}
