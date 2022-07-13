import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:natural/bloc/signup_bloc/signup_bloc.dart';
import 'package:natural/view/create_account/personal_info.dart';
import 'package:natural/view/home.dart';

import '../components/button.dart';
import '../components/constants/constants.dart';
import '../components/text_filled.dart';


class Signin extends StatelessWidget{

  late SignupBloc bloc;
  late var Context;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<SignupBloc>(context);
    Context = context;

    return Scaffold(
      backgroundColor: HexColor('#EFEEE9'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Image.asset("assets/IMG-20220711-WA0070-removebg-preview.png",height: 200,width: 300,
              fit: BoxFit.fill),
              const SizedBox(height: 40,),
              Text_filled(bloc.email_controller,"Email", false),
              const SizedBox(height: 30,),
              Text_filled(bloc.pass_controller, "Password", true),
              const SizedBox(height: 40,),

              BlocBuilder<SignupBloc,SignupState>(builder: (context,state){
                if(state is SignupInitial){
                 return Button("SignIn",const Color.fromARGB(255, 17, 138, 51),Colors.white,signin_function);
                }else if(state is Signinloading){
                  return const CircularProgressIndicator(color: Color.fromARGB(255, 17, 138, 51),);
                }else {
                  return Container();
                }
              }),

              const SizedBox(height: 10,),
              BlocBuilder<SignupBloc,SignupState>(builder: (context,state){
                if(state is SignupInitial){
                  return TextButton(
                    child: const Text('Forgot Password?',style: TextStyle(
                       color: Color.fromARGB(255, 17, 138, 51),fontSize: 20
                    ),),
                    onPressed: (){
                       bloc.add(forget_passwordEvent());
                    },);
                }else if(state is forget_passwordLoading){
                  return const CircularProgressIndicator(color: Color.fromARGB(255, 17, 138, 51),);
                }else {
                  return Container();
                }
              }),

              BlocListener<SignupBloc,SignupState>(listener: (context,state){
                if(state is Signinloaded){
                  home_page();
                }else if(state is SigninFail){
                  show_snackbar(state.error.contains(']')?state.error.split(']')[1]:state.error);
                }else if(state is forget_passwordFail){
                  show_snackbar(state.error.contains(']')?state.error.split(']')[1]:state.error);
                }else if(state is forget_passwordLoaded){
                  show_snackbar(state.message);
                }
              },
              child: Container(),
              ),

          const SizedBox(height: 70,),
           Button("Create An Account",const Color.fromARGB(255, 17, 138, 51),Colors.black,signup_function),

            ],
          ),
        ),
      ),
    );
  }


  void signin_function() {
    bloc.add(SigninEvent());
  }

  void signup_function() {
    signup_page();

  }

  home_page(){
    Navigator.of(Context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        Home()), (Route<dynamic> route) => false);
  }

  signup_page(){
    Navigator.of(Context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    Personal_info()), (Route<dynamic> route) => false);
  }

  show_snackbar(String message){
    ScaffoldMessenger.of(Context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

}




