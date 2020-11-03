import 'package:auth_firebase_bloc/blocs/navigation/navigation_bloc.dart';
import 'package:auth_firebase_bloc/pages/pages/login.dart';
import 'package:auth_firebase_bloc/pages/pages/register.dart';
import 'package:auth_firebase_bloc/pages/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/fonts/fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.white,
          scaffoldBackgroundColor: Colors.blue,
        backgroundColor: Colors.amber,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w400, color: Colors.white),
          headline2: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300, color: Colors.white),
          headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.white),
          bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.blue),
          bodyText2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.white),



        ),

      ),

      home: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is LoginPageSuccess) {
            return LoginPage();
          } else if (state is RegistrationPageSuccess) {
            return RegisterPage();
          } else if (state is WelcomePageSuccess) {
            return Welcome();
          }
          else {
            return Welcome();
          }
        },
      ),

    );
  }
}
