import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/bloc/macro_disease_calculator/macro_calculator_bloc.dart';
import 'package:natural/bloc/macro_disease_calculator/macro_calculator_bloc.dart';
import 'package:natural/view/disease/disease_info.dart';


class AllDisease extends StatelessWidget {

  late MacroCalculatorBloc bloc ;
  late var Context;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<MacroCalculatorBloc>(context);
    bloc.add(FetchDiseaseEvent());
    Context = context;

    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<MacroCalculatorBloc, MacroCalculatorState>(
            builder: (context, state) {
              if(state is LoadingMacrostate){
                return Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 3, 118, 77),),);
              }else if(state is FetchedMacroState){
                return _List_view(bloc);
              }else
                return Container();
            },
          ),
          BlocListener<MacroCalculatorBloc,MacroCalculatorState>(listener:(context, state){
            if(state is FailedMacroState) {
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

  MacroCalculatorBloc bloc;
  _List_view(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount:bloc.disease.length ,
            itemBuilder: (contex,index){
              return Card(
                  color:const Color.fromARGB(255,3,118,77) ,
                  shadowColor: Colors.black,
                  margin: EdgeInsets.all(10),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ) ,
                  child: ListTile(
                    title: Text(bloc.disease[index].name!,style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(
                        builder:(context)=>Disease_info(bloc.disease[index]))),
                  ));
            }));
  }
}