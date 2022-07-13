import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:natural/bloc/chatboot/chatboot_bloc.dart';
import 'package:natural/components/chatboot/chat_message.dart';
import 'package:natural/components/chatboot/question_buttons.dart';
import 'package:natural/view/macro_calculator.dart';
import 'package:natural/view/plan.dart';
import 'package:natural/view/work_out.dart';

import '../bloc/macro_disease_calculator/macro_calculator_bloc.dart';
import '../bloc/workout_plan/workout_bloc.dart';
import '../components/chatboot/chat_listview.dart';




class Chatboot extends StatelessWidget{

  late ChatbootBloc question_bloc ;
  late ChatbootBloc answer_list_bloc ;
  late var Context;
  // late GestureTapCallback function1;
  // late GestureTapCallback function2;
  // late GestureTapCallback function3;

  @override
  Widget build(BuildContext context) {

    question_bloc = ChatbootBloc();
    answer_list_bloc = ChatbootBloc();
    answer_list_bloc.emit(Rebuild_messages_list_state());
    Context = context;

    return Scaffold(
      backgroundColor: HexColor('#EFEEE9'),
      body: Column(
        children: [
          BlocBuilder<ChatbootBloc,ChatbootState>(
              bloc: answer_list_bloc,
              builder: (context, state) {
                if(state is Rebuild_messages_list_state){
                  return Listview(answer_list_bloc);
                }
                return Container();
              }),

          BlocBuilder<ChatbootBloc,ChatbootState>(
              bloc: question_bloc,
              builder: (context, state) {
            if(state is ChatbootInitial){
              return Question_buttons(' I Want To Know The Calories Of Something ',
                  ' I Want To Know About The Available Programs ',
                  ' Feeling ',
                  i_want_know_calorise_something,
                  I_Want_Know_Available_rograms,
                  feeling);
            }else if(state is FeelingState){
              return Question_buttons(' Happy ', ' Sad ', ' Lazy ',
                  happy, sad, lazy);
            }else if(state is ProgramsState){
              return Question_buttons(' Low ', ' Medium ', ' Height ',
                  low, medium, hard);
            }
            return Container();
          }),
        ],
      ),
    );
  }



  i_want_know_calorise_something(){
    answer_list_bloc.add(CaloriseEvent());
    Navigator.of(Context).push(MaterialPageRoute(builder:(context) => Macro_calculator(),));
  }

  //-----feeling ---------
  feeling(){
    question_bloc.emit(FeelingState());
    answer_list_bloc.add(FeelingEvent());
  }

  happy(){
    answer_list_bloc.add(HappyEvent());
    question_bloc.emit(ChatbootInitial());
  }

  sad(){
    answer_list_bloc.add(sadEvent());
    question_bloc.emit(ChatbootInitial());
  }

  lazy(){
    answer_list_bloc.add(lazyEvent());
    question_bloc.emit(ChatbootInitial());
    Navigator.of(Context).push(MaterialPageRoute(builder:(context) => Work_out(),));
  }

  //-----programs---------
  I_Want_Know_Available_rograms(){
    question_bloc.emit(ProgramsState());
    answer_list_bloc.add(ProgramsEvent());
  }
  low(){
    answer_list_bloc.add(LowEvent());
    question_bloc.emit(ChatbootInitial());
    Navigator.of(Context).push(MaterialPageRoute(builder:(context) => Plan(true,specific_plan: '1000',),));
  }

  medium(){
    answer_list_bloc.add(MediumEvent());
    question_bloc.emit(ChatbootInitial());
    Navigator.of(Context).push(MaterialPageRoute(builder:(context) => Plan(true,specific_plan: '2000',),));
  }

  hard(){
    answer_list_bloc.add(HardEvent());
    question_bloc.emit(ChatbootInitial());
    Navigator.of(Context).push(MaterialPageRoute(builder:(context) => Plan(true,specific_plan: '3000',),));
  }

}


