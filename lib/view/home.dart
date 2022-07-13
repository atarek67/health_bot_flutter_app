import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:natural/bloc/home/home_bloc.dart';
import 'package:natural/components/drawer.dart';
import 'package:natural/components/home_components/home_dialog.dart';
import '../components/constants/constants.dart';
import '../components/home_components/home_daily_history.dart';

class Home extends StatelessWidget{

  late HomeBloc history_bloc;
  late HomeBloc tip_bloc;
  late var Context;

  @override
  Widget build(BuildContext context) {

    history_bloc =  HomeBloc();
    tip_bloc = HomeBloc(); //BlocProvider.of<HomeBloc>(context);
    history_bloc.add(FetchHistoryEvent());
    tip_bloc.add(FetchTipsEvent());
    Context = context;

    return Scaffold(
      backgroundColor: HexColor('#EFEEE9'),
       drawer: Drawer(
         backgroundColor: HexColor('#EFEEE9'),
         child: drawer(),
       ),
       appBar: AppBar(
         //backgroundColor: ,
         title: const Text('Daily Tasks'),
         actions: [
           IconButton(
              icon: const Icon(Icons.add,size: 30,),
               onPressed: (){show_dialog();})
         ],
       ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //----------calories----------
              Daily_history(history_bloc, true),
              const SizedBox(height: 30,),
              //---------water------------
              Daily_history(history_bloc, false),

              const SizedBox(height: 30,),
              const Text("Quotes & Tips",style: TextStyle(
                  color:Color.fromARGB(255, 36, 110, 36),
                  fontWeight: FontWeight.bold,fontSize: 20
              ),),
              const SizedBox(height: 10,),
              //---------tip------------
              BlocBuilder<HomeBloc,HomeState>(
                  bloc:tip_bloc ,
                  builder: (context,state){
                    if(state is LoadingTipState){
                      return const CircularProgressIndicator(color: Color.fromARGB(255, 17, 138, 51),);
                    }else if(state is FetchedTipState){
                      return Card(
                        color:const Color.fromARGB(255, 36, 110, 36),
                          shadowColor: Colors.black,
                          //margin: const EdgeInsets.all(10),
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ) ,
                          child:Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width-20,
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

              BlocListener<HomeBloc,HomeState>(
                bloc: history_bloc,
                listener: (context,state){
                if(state is AddCompleteState){
                  Navigator.pop(context);
                  history_bloc.add(FetchHistoryEvent());
                }else if(state is AddUnCompleteState){
                  show_snackbar(state.error);
                }
              },
                child: Container(),
              )
            ],
          ),
        ),
      ),

    );
  }
  show_snackbar(String message){
    ScaffoldMessenger.of(Context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  show_dialog(){
    showDialog(context: Context, builder: (context){
      return AlertDialog(
        title: const Text('Add Your Daily Exercise',style: TextStyle(
            color:Color.fromARGB(255, 17, 138, 51),
            fontWeight: FontWeight.bold,fontSize: 20
        ),),
        content:home_Dialog(history_bloc) ,
        actions: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 17, 138, 51)
              ),
              child: const Text('Confirm',style:  TextStyle(color: Colors.white,fontSize: 18),),
            ),
            onTap: (){
              history_bloc.add(AddDailyExercise());
            },
          )
        ],
      );
    });
  }

}