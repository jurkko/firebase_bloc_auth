import 'dart:async';
import 'package:auth_firebase_bloc/blocs/mainmenu/mainmenu_bloc.dart';
import 'package:auth_firebase_bloc/Repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterInitialEvent) {
      yield RegisterInitial();
    } else if (event is RegistrationEmailChanged) {
      print(event.email);
    } else if (event is RegistrationPasswordChanged) {
      print(event.password);
    } else if (event is EmptyPasswordOrEmail) {
      yield EmptyPasswordOrEmailFailure();
    } else if (event is BackToRegisterPageButtonPressed) {
      yield BackToRegistrationPage();
    } else if (event is RegistrationButtonPressed) {
      yield WaitingForResponse();
      print(event.email + event.password);
      var value = await authenticationRepository.signUp(
          email: event.email, password: event.password);

      if (value == 'Success') {
        yield RegistrationSuccessfull(event.email);
      } else {
        print('moj: ' + value);
        yield RegistrationUnsuccessfull(value);
      }
    }
  }
}
