part of 'mainmenu_bloc.dart';

@immutable
abstract class MainmenuState extends Equatable {
  @override
// TODO: implement props
  List<Object> get props => [];
}

class MainmenuInitial extends MainmenuState {}

class LoadUserSuccess extends MainmenuState {
  String email;

  LoadUserSuccess(this.email);
}
