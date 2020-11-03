import 'dart:async';

import 'package:auth_firebase_bloc/Repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'mainmenu_event.dart';

part 'mainmenu_state.dart';

class MainmenuBloc extends Bloc<MainmenuEvent, MainmenuState> {
  MainmenuBloc() : super(MainmenuInitial());
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<MainmenuState> mapEventToState(
    MainmenuEvent event,
  ) async* {
    if (event is LoadUserEvent) {

      print(event.email);
      print('EMAIL:' + event.email);
      yield LoadUserSuccess(event.email);
    } else if (event is UserSignOut) {
      await authenticationRepository.logOut();
      print('signing out');
      yield MainmenuInitial();
    }
  }
}
