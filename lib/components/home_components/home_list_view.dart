import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import '../../bloc/signup_bloc/signup_bloc.dart';


class List_view extends StatelessWidget{

  HomeBloc bloc;
  bool is_calorise;
  late SignupBloc userbloc;
  List_view(this.bloc,this.is_calorise);

  @override
  Widget build(BuildContext context) {

    userbloc=  BlocProvider.of<SignupBloc>(context);
    return SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount:bloc.history_list.length ,
            itemBuilder: (contex,index){
              return Card(
                  color:const Color.fromARGB(255, 36, 110, 36),
                  shadowColor: Colors.black,
                  //margin: EdgeInsets.all(10),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ) ,
                  child: ListTile(
                    title:Text(bloc.history_list[index].Date!,style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),) ,
                    subtitle: Text(is_calorise?"your Daily Calories should be ${userbloc.user_model.dailyCalorise.toString()}":
                    "your Daily Water Cup should be 10",style: const TextStyle(
                      color: Colors.white30,
                    ),),
                    trailing: Text(is_calorise?bloc.history_list[index].calories.toString():
                    bloc.history_list[index].waterCup.toString(),style: TextStyle(
                      color: is_calorise?
                      (bloc.history_list[index].calories! >= userbloc.user_model.dailyCalorise!-200)&&
                          (bloc.history_list[index].calories! <= userbloc.user_model.dailyCalorise!+200)?
                      Colors.white:Colors.red[400]:
                      (bloc.history_list[index].waterCup! >= 8)?Colors.white:Colors.red[400],fontStyle: FontStyle.italic,
                      fontSize: 20,
                    ),),
                  ));
            }
            )
    );
  }
}