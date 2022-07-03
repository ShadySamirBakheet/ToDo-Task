import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {}

class DatabaseFailure extends Failure {
  DatabaseFailure({
    required this.error,
  });
  final String error;

  @override
  String toString() => 'DatabaseFailure(error: $error)';
}

class EmptyFailure extends Failure {}
