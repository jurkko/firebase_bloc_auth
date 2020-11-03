import 'package:auth_firebase_bloc/blocs/mainmenu/mainmenu_bloc.dart';
import 'package:auth_firebase_bloc/blocs/navigation/navigation_bloc.dart';
import 'package:auth_firebase_bloc/blocs/register/register_bloc.dart';
import 'package:auth_firebase_bloc/pages/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mainmenu.dart';

class RegisterPage extends StatelessWidget {
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  var email;
  var password;

  final _passwordText = TextEditingController();
  final _emailText = TextEditingController();

  bool validatedEmail = false;
  bool validatedPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          title: const Text('Firebase authentication',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ))),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is WaitingForResponse) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RegistrationSuccessfull) {
            BlocProvider.of<MainmenuBloc>(context)
                .add(LoadUserEvent(state.email));
            return MainMenu();
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: AspectRatio(
                        aspectRatio: 8 / 7,
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0),
                                bottomLeft: const Radius.circular(40.0),
                                bottomRight: const Radius.circular(40.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Register',
                                      style: CustomTextStyle.bodyText3(context),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: TextField(
                                        controller: _emailText,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'email',
                                        ),
                                        onChanged: (emailValue) {
                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(RegistrationEmailChanged(
                                                  emailValue));
                                          email = emailValue;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: TextField(
                                        controller: _passwordText,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Password',
                                        ),
                                        onChanged: (passwordValue) {
                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(RegistrationPasswordChanged(
                                                  passwordValue));
                                          password = passwordValue;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.blue)),
                                      minWidth: 120,
                                      height: 50,
                                      color: Colors.white,
                                      onPressed: () {
                                        BlocProvider.of<NavigationBloc>(context)
                                            .add(TriggeredWelcomePage());
                                      },
                                      child: Text(
                                        'Back',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                    FlatButton(
                                      minWidth: 120,
                                      height: 50,
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.blue)),
                                      onPressed: () {
                                        if (_emailText.text.isEmpty ||
                                            _passwordText.text.isEmpty) {
                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(EmptyPasswordOrEmail());
                                        } else {
                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(RegistrationButtonPressed(
                                                  email, password));
                                        }
                                      },
                                      child: Text(
                                        'Register',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, innerState) {
                      if (state is RegistrationUnsuccessfull) {
                        return AlertDialog(
                          title: Text('Register error'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(state.errorMessage.toString()),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Ok'),
                              onPressed: () {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(RegisterInitialEvent());
                              },
                            ),
                          ],
                        );
                      } else if (state is EmptyPasswordOrEmailFailure) {
                        return AlertDialog(
                          title: Text('Empty password or email'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                    'Looks like you\'ve left password or email field empty'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Ok'),
                              onPressed: () {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(RegisterInitialEvent());
                              },
                            ),
                          ],
                        );
                      } else
                        return Container();
                    })
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
