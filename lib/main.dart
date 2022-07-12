import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/bloc/chatboot/chatboot_bloc.dart';
import 'package:natural/bloc/home/home_bloc.dart';
import 'package:natural/view/signin.dart';
import 'animated.dart';
import 'bloc/macro_disease_calculator/macro_calculator_bloc.dart';
import 'bloc/signup_bloc/signup_bloc.dart';
import 'bloc/workout_plan/workout_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          BlocProvider<WorkoutBloc>(
            create: (_) => WorkoutBloc(),
          ),
          BlocProvider<ChatbootBloc>(
            create: (_) => ChatbootBloc(),
          ),
        ],
        child: MaterialApp(
        theme: ThemeData(

          colorScheme: ThemeData().colorScheme.copyWith(primary: const Color.fromARGB(255, 17, 138, 51)),
          primaryColor: const Color.fromARGB(255, 17, 138, 51),
          backgroundColor: const Color.fromARGB(255, 17, 138, 51),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 17, 138, 51),
          )
        ),
        debugShowCheckedModeBanner: false,
        home: CustomAnimatedSplash(Signin()),
        ));
  }
}