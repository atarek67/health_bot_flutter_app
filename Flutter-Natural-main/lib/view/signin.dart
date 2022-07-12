import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/bloc/signup_bloc/signup_bloc.dart';
import 'package:natural/view/create_account/personal_info.dart';
import 'package:natural/view/home.dart';

import '../components/button.dart';
import '../components/text_filled.dart';


class Signin extends StatelessWidget{

  late SignupBloc bloc ;
  late var Context;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<SignupBloc>(context);
    Context = context;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image.asset("assets/fat_thin.gif",height: 200,width: 300,),
            SizedBox(height: 20,),
            Text_filled(bloc.email_controller,"Email", false),
            SizedBox(height: 30,),
            Text_filled(bloc.pass_controller, "Password", true),
            SizedBox(height: 40,),

            BlocBuilder<SignupBloc,SignupState>(builder: (context,state){
              if(state is SignupInitial){
               return Button("SignIn",Color.fromARGB(255,3,118,77),Colors.white,signin_function);
              }else if(state is Signinloading){
                return CircularProgressIndicator(color: const Color.fromARGB(255,3,118,77),);
              }else
                return Container();
            }),

            BlocListener<SignupBloc,SignupState>(listener: (context,state){
              if(state is Signinloaded){
                home_page();
              }else if(state is SigninFail){
                show_snackbar(state.error.contains(']')?state.error.split(']')[1]:state.error);
              }
            },
            child: Container(),
            ),

        SizedBox(height: 70,),
         Button("Create An Account",Color.fromARGB(255,247,219,180),Colors.black,signup_function),

          ],
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




