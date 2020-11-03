part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}


class TriggeredLoginPage extends NavigationEvent {}

class TriggeredRegistrationPage extends NavigationEvent {}

class TriggeredWelcomePage extends NavigationEvent {}