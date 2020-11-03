import 'package:auth_firebase_bloc/blocs/navigation/navigation_bloc.dart';
import 'package:auth_firebase_bloc/pages/fonts/fonts.dart';
import 'package:auth_firebase_bloc/pages/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase authentication',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (context) => NavigationBloc(),
            child: BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                if (state is LoginPageSuccess) {
                  return LoginPage();
                } else if (state is RegistrationPageSuccess) {
                  return RegisterPage();
                } else {
                  return Container();
                }
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 150, 0),
                      child: Text(
                        'Firebase & BLOC:',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Text(
                      'Authentication',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                      child: Text(
                        'Demo app',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Login or register:',
                          style: CustomTextStyle.bodyText3(context),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)),
                          minWidth: 200,
                          height: 50,
                          color: Colors.white,
                          onPressed: () {
                            BlocProvider.of<NavigationBloc>(context)
                                .add(TriggeredLoginPage());
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        FlatButton(
                          minWidth: 200,
                          height: 50,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)),
                          onPressed: () {
                            BlocProvider.of<NavigationBloc>(context)
                                .add(TriggeredRegistrationPage());
                          },
                          child: Text(
                            'Register',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
