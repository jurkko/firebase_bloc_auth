import 'dart:async';

import 'package:auth_firebase_bloc/Repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  AuthenticationRepository authenticationRepository =
  AuthenticationRepository();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEmailChanged) {
      print(event.email);
    } else if (event is LoginInitialEvent) {
      yield LoginInitialState();
    } else if (event is LoginPasswordChanged) {
      print(event.password);
    } else if (event is EmptyPasswordOrEmail) {
      yield EmptyPasswordOrEmailFailure();
    } else if (event is LoginButtonPressed){
      yield WaitingForResponse();
      print(event.email + event.password);
      var value = await authenticationRepository.logInWithEmailAndPassword(
          email: event.email, password: event.password);
      if (value == 'Success') {
        yield LoginSuccessfullState(event.email);
      } else {

        print('moj: ' + value);
        yield LoginUnsuccessfull(value);
      }
    }
  }
}
