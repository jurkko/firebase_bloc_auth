part of 'mainmenu_bloc.dart';

@immutable
abstract class MainmenuEvent extends Equatable {
  const MainmenuEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends MainmenuEvent {
  String email;

  LoadUserEvent(this.email);
}

class UserSignOut extends MainmenuEvent {}
