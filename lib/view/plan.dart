import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:natural/bloc/workout_plan/workout_bloc.dart';
import 'package:natural/repository/workout_plan_repo.dart';

import '../bloc/signup_bloc/signup_bloc.dart';
import '../components/plan/draw_plan.dart';

class Plan extends StatelessWidget{

  late WorkoutBloc plan_bloc;
  late var Context;
  bool need_specific_plan;
  String ?specific_plan;

  Plan(this.need_specific_plan,{String ?specific_plan}){
    this.specific_plan = specific_plan;
  }

  @override
  Widget build(BuildContext context) {
    SignupBloc bloc =  BlocProvider.of<SignupBloc>(context);
    plan_bloc = BlocProvider.of<WorkoutBloc>(context);
    plan_bloc.work_repo = Workout_repo();
    if(need_specific_plan){
      plan_bloc.add(FetchPlanEvent(specific_plan!));
    }else {
      plan_bloc.add(FetchPlanEvent(bloc.user_model.dailyCalorise!.toString()));
    }
    Context = context;
    return Scaffold(
      backgroundColor: HexColor('#EFEEE9'),
      appBar: AppBar(
        title: Text(need_specific_plan?'Plan For $specific_plan Calories':'Your Daily Meal'),
      ),
       body: Column(
         children: [
           BlocBuilder<WorkoutBloc,WorkoutState>(builder: (context,state){
             if(state is LoadingPlanState){
               return const Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 17, 138, 51),),);
             }else if(state is FetchedPlanState){
               return Draw_plan(plan_bloc);
             }
             
             return Container();
           }),
         ],
       ),
    );
  }

}

