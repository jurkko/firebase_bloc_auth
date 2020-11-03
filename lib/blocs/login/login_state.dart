part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginSubmittedState extends LoginState {}

class LoginSuccessfullState extends LoginState {
  String email;

  LoginSuccessfullState(this.email);
}

class WaitingForResponse extends LoginState {}

class EmailEmpty extends LoginState {}

class PasswordEmpty extends LoginState {}

class LoginUnsuccessfull extends LoginState {
  String errorMessage;

  LoginUnsuccessfull(this.errorMessage);
}

class EmptyPasswordOrEmailFailure extends LoginState {}
