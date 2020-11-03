part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterInitialEvent extends RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {}

class RegistrationEmailChanged extends RegisterEvent {
  const RegistrationEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class RegistrationPasswordChanged extends RegisterEvent {
  const RegistrationPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegistrationButtonPressed extends RegisterEvent {
  const RegistrationButtonPressed(this.email, this.password);

  final String password;
  final String email;

  @override
  List<Object> get props => [email, password];
}

class BackToRegisterPageButtonPressed extends RegisterEvent {
  const BackToRegisterPageButtonPressed();

  @override
  List<Object> get props => [];
}

class EmptyPasswordOrEmail extends RegisterEvent {
  const EmptyPasswordOrEmail();

  @override
  List<Object> get props => [];
}
