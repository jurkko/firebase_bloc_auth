import 'package:auth_firebase_bloc/blocs/register/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'package:auth_firebase_bloc/simple_bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

import 'blocs/login/login_bloc.dart';
import 'blocs/mainmenu/mainmenu_bloc.dart';
import 'blocs/navigation/navigation_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => MainmenuBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
