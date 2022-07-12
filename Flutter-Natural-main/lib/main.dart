import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/bloc/home/home_bloc.dart';
import 'package:natural/view/signin.dart';

import 'bloc/macro_disease_calculator/macro_calculator_bloc.dart';
import 'bloc/signup_bloc/signup_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider<SignupBloc>(
            create: (_) => SignupBloc(),
          ),
          BlocProvider<MacroCalculatorBloc>(
          create: (_) => MacroCalculatorBloc(),
          ),
          BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(),
          ),
        ],
        child: MaterialApp(
        theme: ThemeData(

          colorScheme: ThemeData().colorScheme.copyWith(primary: const Color.fromARGB(255,3,118,77)),
          primaryColor: const Color.fromARGB(255,3,118,77),
          backgroundColor: const Color.fromARGB(255,3,118,77),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255,3,118,77),
          )
        ),
        home: Signin(),
        ));
  }
}