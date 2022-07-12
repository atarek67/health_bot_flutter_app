import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/components/button.dart';
import 'package:natural/components/dropdwon_button.dart';
import 'package:natural/components/text_filled.dart';
import 'package:natural/view/create_account/fat_history.dart';
import 'package:natural/view/signin.dart';

import '../../bloc/signup_bloc/signup_bloc.dart';


class Personal_info extends StatelessWidget {

  late SignupBloc bloc;
  late var Context;
  late var dropdown ;


  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SignupBloc>(context);
    dropdown = Dropdwon_button();
    Context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Text_filled(bloc.user_name, 'Name', false),
            const SizedBox(height: 20,),
            Text_filled(bloc.current_weight, 'Weight', false,keyboard_type: TextInputType.number,),
            const SizedBox(height: 20,),
            Text_filled(bloc.long, 'Height', false,keyboard_type: TextInputType.number,),
            const SizedBox(height: 20,),
            //date picker
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: ListTile(
                title: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  if(state is Select_birthDate) {
                    return Text(state.date, style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 3, 118, 77) ),);
                  }else
                    return Text(bloc.birth_date, style: TextStyle(fontSize: 20,color: Colors.black38),);
                },
              ),
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                ),
                onTap: () async {
                  final DateTime? selected = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1960),
                    lastDate: DateTime.now(),

                  );
                  if (selected != null) {
                    bloc.add(SelectTimeEvent(selected.toString().substring(0,10)));
                  }
                },
              ),
            ),
            const SizedBox(height: 20,),
            //Text_filled(bloc.sex, 'Sex', false),
            dropdown,
            const SizedBox(height: 50,),
          Button('Confirm', Color.fromARGB(255, 3, 118, 77), Colors.white,
              confirm_personal_info),
            BlocListener<SignupBloc, SignupState>(listener: (context, state) {
                if(state is Pesronal_info_completed){
                  Fat_history_page();
                }else if(state is Pesronal_info_uncompleted){
                  show_snackbar(state.error);
                }
            },
              child: Container(),
            ),
            SizedBox(height: 60,),
            Button("Have An Account",Color.fromARGB(255,247,219,180),Colors.black,signin_function),

          ],
        ),
      ),
    );
  }

  Fat_history_page(){
    Navigator.of(Context).push(MaterialPageRoute(builder: (context) =>
        Fat_disease_history()));
  }

  show_snackbar(String message){
    ScaffoldMessenger.of(Context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
  confirm_personal_info() {
    bloc.sex = dropdown.selected();
    bloc.add(CheckPersonalInfo());
  }

  void signin_function() {
    bloc.emit(SignupInitial());
    Navigator.of(Context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        Signin()), (Route<dynamic> route) => false);
  }

}