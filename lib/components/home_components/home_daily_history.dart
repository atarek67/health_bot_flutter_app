import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/components/home_components/home_list_view.dart';
import '../../bloc/home/home_bloc.dart';




class Daily_history extends StatelessWidget{

  HomeBloc bloc ;
  bool is_calories;
  Daily_history(this.bloc,this.is_calories);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(is_calories?"Daily Calories":"Daily Water Cup",style: const TextStyle(
            color:Color.fromARGB(255, 17, 138, 51),
            fontWeight: FontWeight.bold,fontSize: 20
        ),),
        SizedBox(height: 10,),
        BlocBuilder<HomeBloc,HomeState>(
            bloc: bloc,
            builder: (context,state){
              if(state is LoadingHistoryState){
                return const CircularProgressIndicator(color: Color.fromARGB(255, 17, 138, 51),);
              }else if(state is FetchedHistoryState){
                return List_view(bloc, is_calories);
              }else if(state is FailedHistoryState) {
                return const Center(child:  Text('No Data'),);
              }

              return Container();
            }),
      ],
    );
  }

}