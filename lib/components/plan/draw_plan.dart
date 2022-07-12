
import 'package:flutter/material.dart';

import '../../bloc/workout_plan/workout_bloc.dart';

class Draw_plan extends StatelessWidget{

  WorkoutBloc bloc;
  Draw_plan(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Draw_list_tile('Fats',bloc.model.fats ),
          Draw_list_view(bloc.Fats),
          const SizedBox(height: 30,),
          Draw_list_tile('Fruits',bloc.model.fruits ),
          Draw_list_view(bloc.Fruits),
          const SizedBox(height: 30,),
          Draw_list_tile('Lean meats',bloc.model.leanMeats ),
          Draw_list_view(bloc.Lean_meats),
          const SizedBox(height: 30,),
          Draw_list_tile('Nonfat milk',bloc.model.nonfatMilk ),
          Draw_list_view(bloc.Nonfat_milk),
          const SizedBox(height: 30,),
          Draw_list_tile('Starch',bloc.model.starch ),
          Draw_list_view(bloc.Starch),
          const SizedBox(height: 30,),
          Draw_list_tile('Vegetables',bloc.model.vegetables ),
          Draw_list_view(bloc.Vegetables),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }

  Widget Draw_list_tile(title,number){
    return ListTile(
      title: Text(title,style:const TextStyle(
          color:Color.fromARGB(255, 17, 138, 51),
          fontSize: 30, fontWeight: FontWeight.bold
      ),),
      leading:Text(number,style: const TextStyle(
          color:Color.fromARGB(255, 17, 138, 51),
          fontSize: 30,fontWeight: FontWeight.bold
      ),) ,
    );
  }

}

class Draw_list_view extends StatelessWidget{

  List<dynamic> list;
  Draw_list_view(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          itemCount:list.length ,
          itemBuilder: (contex,index){
            return Card(
              color:const Color.fromARGB(255, 17, 138, 51) ,
              shadowColor: Colors.black,
              margin:const EdgeInsets.all(5),
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ) ,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(list[index].toString(),style:const TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),);
          }),
    );
  }
}

