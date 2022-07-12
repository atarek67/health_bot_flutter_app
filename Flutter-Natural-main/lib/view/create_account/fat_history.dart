import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/components/check_box.dart';
import 'package:natural/components/text_filled.dart';
import 'package:natural/view/create_account/signup.dart';

import '../../bloc/signup_bloc/signup_bloc.dart';
import '../../components/button.dart';


class Fat_disease_history extends StatelessWidget {

  late SignupBloc bloc;
  late var Context;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SignupBloc>(context);
    Context = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Obesity Medical History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            //natural pelan before
            Check_box(
                'Have You Previously Followed Any Nutrition Plan ?',
                    (check){
                  bloc.user_model.doNaturalPlanBefore =check;
                }),
            const SizedBox(height: 30,),
            Text_filled(bloc.goal_weight, 'Goal', false,keyboard_type: TextInputType.number,),
            const SizedBox(height: 20,),
            //have Chronic Disease
            Check_box('Do You Have Any Chronic Disease ?',
                    (check){
                  bloc.add(Show_ChronicDiseaseEvent(check));
               }),
            BlocBuilder<SignupBloc, SignupState>(builder: (context,state){
              if(state is Show_ChronicDiseaseState){
                if(state.is_visible){
                  return _List_view(bloc);
                }
              }
              return Container();
            }),
            const SizedBox(height: 30,),

            BlocListener<SignupBloc, SignupState>(
                listener: (context,state){
                      if(state is fat_history_completed){
                        Signup_page();
                      }else if(state is fat_history_uncompleted){
                        show_snackbar(state.error);
                      }
            },
            child:Button("Confirm", Color.fromARGB(255, 3, 118, 77), Colors.white,confirm_fat_history),
            )
          ],
        ),
      ),
    );
  }

  Signup_page(){
    bloc.emit(SignupInitial());
    Navigator.of(Context).push(MaterialPageRoute(builder: (context) =>
        Signup()));
  }

  show_snackbar(String message){
    ScaffoldMessenger.of(Context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  confirm_fat_history() {
    bloc.add(CheckFatHistory());
  }


}




class _List_view extends StatelessWidget{

  List<String> list = ['disease name 1','disease name 2','disease name 3','disease name 4'];
  SignupBloc bloc;
  _List_view(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 40),
        height: 250,
        child: ListView.builder(
            itemCount:list.length ,
            itemBuilder: (contex,index){
              return Check_box(list[index],
                  (check){
                     if(check==false){
                       bloc.chronic_disease.remove(list[index]);
                     }else {
                       bloc.chronic_disease[list[index]] = check;
                     }
                  });
            }));
  }

}
