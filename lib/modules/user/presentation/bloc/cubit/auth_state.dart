part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthTypeState extends AuthState {}

class AuthDoneState extends AuthState {}

class AuthErrorState extends AuthState {}

class UserAuthState extends AuthState {}

class UserNotAuthState extends AuthState {}

class UserOutState extends AuthState {}
