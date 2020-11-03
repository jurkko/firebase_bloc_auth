part of 'register_bloc.dart';

@immutable
abstract class RegisterState extends Equatable {
  @override
// TODO: implement props
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class LoginSubmittedState extends RegisterState {}

class WaitingForResponse extends RegisterState {}

class RegistrationSuccessfull extends RegisterState {
  String email;

  RegistrationSuccessfull(this.email);
}

class RegistrationUnsuccessfull extends RegisterState {
  String errorMessage;

  RegistrationUnsuccessfull(this.errorMessage);
}

class BackToRegistrationPage extends RegisterState {}

class EmptyPasswordOrEmailFailure extends RegisterState {}
