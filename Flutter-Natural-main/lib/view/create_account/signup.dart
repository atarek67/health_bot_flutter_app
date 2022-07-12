import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/bloc/signup_bloc/signup_bloc.dart';

import '../../components/button.dart';
import '../../components/text_filled.dart';
import '../home.dart';




class Signup extends StatelessWidget{

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
            SizedBox(height: 40,),
            Text_filled(bloc.email_controller,"Email", false),
            SizedBox(height: 30,),
            Text_filled(bloc.pass_controller, "Password", true),
            SizedBox(height: 40,),
            BlocBuilder<SignupBloc,SignupState>(builder: (context,state){
              if(state is SignupInitial){
                return Button("SignUp",Color.fromARGB(255,3,118,77),Colors.white,signup_function);
              }else if(state is Signuploading){
                return CircularProgressIndicator(color: const Color.fromARGB(255,3,118,77),);
              }else
                return Container();
            }),

            BlocListener<SignupBloc,SignupState>(listener: (context,state){
              if(state is SignupUploaded){
                home_page();
              }else if(state is SignupFail){
                show_snackbar(state.error.split(']')[1]);
              }
            },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }


  void signup_function() {
    bloc.add(CreateUserEvent());
  }

  show_snackbar(String message){
    ScaffoldMessenger.of(Context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  home_page(){
    Navigator.of(Context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        Home()), (Route<dynamic> route) => false);
  }

}




