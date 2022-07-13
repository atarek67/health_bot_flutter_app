import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/workout_plan/workout_bloc.dart';
import '../repository/workout_plan_repo.dart';




class Work_out extends StatelessWidget{

  late WorkoutBloc bloc ;
  late var Context;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<WorkoutBloc>(context);
    bloc.work_repo = Workout_repo();
    bloc.add(FetchExerciseEvent());
    Context = context;

    return Scaffold(
      backgroundColor: HexColor('#EFEEE9'),
      body: Column(
        children: [
          BlocBuilder<WorkoutBloc,WorkoutState>(
            builder:(context,state){
                if(state is LoadingExerciseState){
                  return const Center(child: CircularProgressIndicator(color:  Color.fromARGB(255, 17, 138, 51),));
                }else if(state is FetchedExerciseState){
                  return _List_view(bloc);
                }
                return Container();
            },
          ),

          BlocListener<WorkoutBloc,WorkoutState>(listener:(context, state){
            if(state is FailedExerciseState) {
              show_snackbar(state.error);
            }
          },
            child: Container(),
          )
        ],
      ),
    );
  }

  show_snackbar(String message){
    ScaffoldMessenger.of(Context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

}

class _List_view extends StatelessWidget{

  WorkoutBloc bloc;
  _List_view(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount:bloc.exercise_list.length ,
            itemBuilder: (context,index){
              return Card(
                  color:const Color.fromARGB(255, 17, 138, 51) ,
                  shadowColor: Colors.black,
                  margin:const EdgeInsets.all(5),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ) ,
                  child: list_item(index));
            }));
  }

  Widget list_item(index){
    return Container(
     // width: 250,
      child: ListTile(
        title: Text(bloc.exercise_list[index].exerciseName!,style: const TextStyle(
          color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold,),),

        subtitle: Text(bloc.exercise_list[index].description!,maxLines: 3,overflow: TextOverflow.ellipsis ,style: const TextStyle(
          color: Colors.white70),),
        onTap: () async {
          await launchUrl(
            Uri.parse(bloc.exercise_list[index].youtubeLink!),
            mode: LaunchMode.externalApplication,
          ) ;
        },
        trailing: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(bloc.exercise_list[index].imageLink!),fit: BoxFit.contain)
          ),
        ),
      ),
    );
  }

}