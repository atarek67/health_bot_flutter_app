import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:natural/view/chatboot.dart';
import 'package:natural/view/disease/all_disease.dart';
import 'package:natural/view/plan.dart';
import 'package:natural/view/work_out.dart';

import '../bloc/chatboot/chatboot_bloc.dart';
import '../bloc/macro_disease_calculator/macro_calculator_bloc.dart';
import '../bloc/workout_plan/workout_bloc.dart';
import '../view/macro_calculator.dart';
import '../view/profile_info.dart';

class drawer extends StatelessWidget{

  late MacroCalculatorBloc macro_bloc;

  @override
  Widget build(BuildContext context) {

    return Drawer(
       backgroundColor: HexColor('#242526'),
      child:ListView(
        children: [
        const DrawerHeader(
              child:CircleAvatar(backgroundImage: AssetImage('assets/fat_thin.gif'),),
              decoration: BoxDecoration(color: Color.fromARGB(255, 17, 138, 51)),
          ),
          const SizedBox(height: 30,),
          _drawe_button('Profile Information',(){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Profile_info()));
          }),
          const SizedBox(height: 25,),
          _drawe_button('Macro Calculator', () {
            BlocProvider<MacroCalculatorBloc>(
              create: (_) => MacroCalculatorBloc(),
            );
             Navigator.push(context, MaterialPageRoute(builder:(context)=>Macro_calculator()));
          }),
          const SizedBox(height: 25,),
          _drawe_button('Work Out', () {
            BlocProvider<WorkoutBloc>(
              create: (_) => WorkoutBloc(),
            );
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Work_out()));
          }),
          const SizedBox(height: 25,),
          _drawe_button('Disease Instructions', () {
            BlocProvider<MacroCalculatorBloc>(
              create: (_) => MacroCalculatorBloc(),
            );
             Navigator.push(context, MaterialPageRoute(builder:(context)=>AllDisease()));
          }),
          const SizedBox(height: 25,),
          _drawe_button('Plan', () {
            BlocProvider<WorkoutBloc>(
              create: (_) => WorkoutBloc(),
            );
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Plan(false)));
          }),
          const SizedBox(height: 25,),
          _drawe_button('Chatbot', () {
            BlocProvider<ChatbootBloc>(
              create: (_) => ChatbootBloc(),
            );
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Chatboot()));
          })
        ],
      ) ,
    );
  }

}

class _drawe_button extends StatelessWidget{

  String title;
  GestureTapCallback function;

  _drawe_button(this.title,this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: GestureDetector(
        child: Text(title,style: const TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 18),),
        onTap: function,
      ),
    );
  }

}