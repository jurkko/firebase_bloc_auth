import 'package:auth_firebase_bloc/blocs/login/login_bloc.dart';
import 'package:auth_firebase_bloc/blocs/mainmenu/mainmenu_bloc.dart';
import 'package:auth_firebase_bloc/blocs/navigation/navigation_bloc.dart';
import 'package:auth_firebase_bloc/blocs/register/register_bloc.dart';
import 'package:auth_firebase_bloc/pages/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<MainmenuBloc, MainmenuState>(builder: (context, state) {
              if (state is LoadUserSuccess) {
                return Column(
                  children: [
                    Text(
                      'Welcome! ',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        state.email,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    )
                  ],
                );
              } else
                return Container();
            }),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              minWidth: 200,
              height: 50,
              color: Colors.white,
              onPressed: () {
                BlocProvider.of<MainmenuBloc>(context).add(UserSignOut());
                BlocProvider.of<RegisterBloc>(context)
                    .add(BackToRegisterPageButtonPressed());
                BlocProvider.of<LoginBloc>(context).add(LoginInitialEvent());
                BlocProvider.of<NavigationBloc>(context)
                    .add(TriggeredWelcomePage());
              },
              child: Text(
                'Log out',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
