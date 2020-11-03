part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginInitialEvent extends LoginEvent {}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed(this.email, this.password);

  final String password;
  final String email;

  @override
  List<Object> get props => [email, password];
}

class BackToLoginPageButtonPressed extends LoginEvent {
  const BackToLoginPageButtonPressed();

  @override
  List<Object> get props => [];
}

class EmptyPasswordOrEmail extends LoginEvent {
  const EmptyPasswordOrEmail();

  @override
  List<Object> get props => [];
}
