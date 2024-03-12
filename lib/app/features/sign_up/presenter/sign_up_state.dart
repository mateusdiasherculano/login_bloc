import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String message;

  const SignUpErrorState(this.message);

  @override
  List<Object> get props => [message];
}
