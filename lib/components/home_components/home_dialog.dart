import 'package:flutter/material.dart';
import 'package:natural/bloc/home/home_bloc.dart';
import 'package:natural/components/text_filled.dart';

class home_Dialog extends StatelessWidget{
  HomeBloc bloc;
  home_Dialog(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Text_filled(bloc.calories, "Calories", false,keyboard_type:TextInputType.number,),
          const SizedBox(height: 35,),
          Text_filled(bloc.water_cup, "Water Cup", false,keyboard_type:TextInputType.number,),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}