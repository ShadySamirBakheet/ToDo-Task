part of 'passwordmanage_cubit.dart';

abstract class PasswordmanageState {
  const PasswordmanageState();
}

class PasswordmanageInitial extends PasswordmanageState {}

class PasswordmanageChange extends PasswordmanageState {
  const PasswordmanageChange({
    required this.isVisable,
  });
  final bool isVisable;
}
