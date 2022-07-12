import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/bloc/home/home_bloc.dart';
import 'package:natural/bloc/signup_bloc/signup_bloc.dart';
import 'package:natural/components/drawer.dart';



class Home extends StatelessWidget{

  late HomeBloc history_bloc ;
  late HomeBloc tip_bloc ;
  late var Context;

  @override
  Widget build(BuildContext context) {

    history_bloc =  HomeBloc();
    tip_bloc = HomeBloc(); //BlocProvider.of<HomeBloc>(context);
    history_bloc.add(FetchHistoryEvent());
    tip_bloc.add(FetchTipsEvent());
    Context = context;

    return Scaffold(
       drawer: Drawer(
         child: drawer(),
       ),
       appBar: AppBar(
         title: const Text('Daily Tasks'),
       ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Daily Calories",style: TextStyle(
              color: Color.fromARGB(255,3,118,77),
              fontWeight: FontWeight.bold,fontSize: 20
            ),),

            //----------calories----------
            BlocBuilder<HomeBloc,HomeState>(
              bloc: history_bloc,
                builder: (context,state){
              if(state is LoadingHistoryState){
                return const CircularProgressIndicator(color: Color.fromARGB(255,3,118,77),);
              }else if(state is FetchedHistoryState){
                return _List_view(history_bloc, true);
              }else if(state is FailedHistoryState)
                return Center(child: Text('No Data'),);

              return Container();
            }),
            const SizedBox(height: 30,),
            const Text("Daily Water Cup",style: TextStyle(
                color: Color.fromARGB(255,3,118,77),
                fontWeight: FontWeight.bold,fontSize: 20
            ),),

            //---------water------------
            BlocBuilder<HomeBloc,HomeState>(
                bloc:history_bloc ,
                builder: (context,state){
              if(state is LoadingHistoryState){
                return CircularProgressIndicator(color: const Color.fromARGB(255,3,118,77),);
              }else if(state is FetchedHistoryState){
                return _List_view(history_bloc, false);
              }else if(state is FailedHistoryState)
                return Center(child: Text('No Data'),);

              return Container();
            }),

            const SizedBox(height: 30,),
            const Text("Tip",style: TextStyle(
                color:Color.fromARGB(255,3,118,77),
                fontWeight: FontWeight.bold,fontSize: 20
            ),),
            const SizedBox(height: 0,),
            //---------tip------------
            BlocBuilder<HomeBloc,HomeState>(
                bloc:tip_bloc ,
                builder: (context,state){
                  if(state is LoadingTipState){
                    return const CircularProgressIndicator(color: Color.fromARGB(255,3,118,77),);
                  }else if(state is FetchedTipState){
                    return Card(
                        color:const Color.fromARGB(255,3,118,77) ,
                        shadowColor: Colors.black,
                        //margin: const EdgeInsets.all(10),
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ) ,
                        child:Container(
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width-10,
                          child: Center(
                            child: Text(tip_bloc.tip,style: const TextStyle(
                                color:Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 20
                            ),),
                          ),
                        ),);
                  }else if(state is FailedTipState) {
                    return const Center(child:  Text('No Data'),);
                  }
                  return Container();
                }),
          ],
        ),
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

  HomeBloc bloc;
  bool is_calorise;
  late SignupBloc userbloc;
  _List_view(this.bloc,this.is_calorise);

  @override
  Widget build(BuildContext context) {

    userbloc=  BlocProvider.of<SignupBloc>(context);
    return Container(
      height: 180,
        child: ListView.builder(
            itemCount:bloc.history_list.length ,
            itemBuilder: (contex,index){
              return Card(
                  color:const Color.fromARGB(255,3,118,77) ,
                  shadowColor: Colors.black,
                  //margin: EdgeInsets.all(10),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ) ,
                  child: ListTile(
                    title:Text(bloc.history_list[index].Date!,style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),) ,
                    subtitle: Text(is_calorise?"your Daily Calories should be ${userbloc.user_model.dailyCalorise.toString()}":
                    "your Daily Water Cup should be 10",style: TextStyle(
                        color: Colors.white30,
                    ),),
                    trailing: Text(is_calorise?bloc.history_list[index].calories.toString():
                    bloc.history_list[index].waterCup.toString(),style: TextStyle(
                        color: is_calorise?
                        (bloc.history_list[index].calories==userbloc.user_model.dailyCalorise)?Colors.white:Colors.red:
                        (bloc.history_list[index].waterCup! >= 10)?Colors.white:Colors.red,
                        fontSize: 20,
                    ),),
                  ));
            }));
  }
}

