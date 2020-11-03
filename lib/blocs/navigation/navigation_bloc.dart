import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial());

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is TriggeredLoginPage) {
      print('login page');
      yield LoginPageSuccess();
    } else if (event is TriggeredRegistrationPage) {
      print('registration page');
      yield RegistrationPageSuccess();
    } else if (event is TriggeredWelcomePage) {
      print('registration page');
      yield WelcomePageSuccess();
    }

  }
}
