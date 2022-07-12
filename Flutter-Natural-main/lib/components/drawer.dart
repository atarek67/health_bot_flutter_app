import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/view/disease/all_disease.dart';

import '../bloc/macro_disease_calculator/macro_calculator_bloc.dart';
import '../view/macro_calculator.dart';




class drawer extends StatelessWidget{

  late MacroCalculatorBloc macro_bloc;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child:ListView(
        children: [
          DrawerHeader(
              child:CircleAvatar(backgroundImage: AssetImage('assets/fat_thin.gif'),),
              decoration: BoxDecoration(color: Color.fromARGB(255, 3, 118, 77)),
          ),
          const SizedBox(height: 30,),
          _drawe_button('Profile Information',(){
           // Navigator.push(context, MaterialPageRoute(builder:(context)=>Profile_info));
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
            // Navigator.push(context, MaterialPageRoute(builder:(context)=>Profile_info));
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
            // Navigator.push(context, MaterialPageRoute(builder:(context)=>Profile_info));
          }),
          const SizedBox(height: 25,),
          _drawe_button('Chatbot', () {
            // Navigator.push(context, MaterialPageRoute(builder:(context)=>Profile_info));
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
      margin: EdgeInsets.only(left: 30),
      child: GestureDetector(
        child: Text(title,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 18),),
        onTap: function,
      ),
    );
  }

}