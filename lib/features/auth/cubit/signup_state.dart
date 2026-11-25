import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final User user;
  const SignUpSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class SignUpFailure extends SignUpState {
  final String errorMessage;
  const SignUpFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
