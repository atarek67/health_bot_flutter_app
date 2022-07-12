import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/components/text_filled.dart';

import '../bloc/macro_disease_calculator/macro_calculator_bloc.dart';



class Macro_calculator extends StatelessWidget{

  late MacroCalculatorBloc bloc ;
  late var Context;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<MacroCalculatorBloc>(context);
    bloc.add(FetchMacroEvent());
    Context = context;

    return Scaffold(
     body:Column(
       children: [
         SizedBox(height: 20,),
         _textFiled(bloc),
         BlocBuilder<MacroCalculatorBloc,MacroCalculatorState>(builder: (context, state){
             if(state is LoadingMacrostate){
               return CircularProgressIndicator(color: const Color.fromARGB(255,3,118,77),);
             }else if(state is FetchedMacroState){
               return _List_view(bloc);
             }else
               return Container();
           }),

         BlocListener<MacroCalculatorBloc,MacroCalculatorState>(listener:(context, state){
           if(state is FailedMacroState) {
             show_snackbar(state.error);
           }
         },
         child: Container(),
         )
       ],
     ) ,
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
            itemCount:bloc.search_macro_list.length ,
            itemBuilder: (contex,index){
              return Card(
                  color:const Color.fromARGB(255,3,118,77) ,
                  shadowColor: Colors.black,
                  margin: EdgeInsets.all(10),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ) ,
                  child: list_item(index));
            }));
  }

  Widget list_item(index){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(bloc.search_macro_list[index].foodName!,style: TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.bold,fontSize: 20
          ),),

          Row(
            children: [
              Column(
                children: [
                  const Text('Calories',style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 16
                  )),
                  Text(bloc.search_macro_list[index].calories!,style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 16
                  ))
                ],
              ),
              const SizedBox(width: 30,),
              Column(
                children: [
                  Text('Fat',style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 16
                  )),
                  Text(bloc.search_macro_list[index].fat!,style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 16
                  ))
                ],
              ),
              const SizedBox(width: 30,),
              Column(
                children: [
                  const Text('Protein',style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 16
                  )),
                  Text(bloc.search_macro_list[index].protein!,style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 16
                  ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class _textFiled extends StatelessWidget{

  MacroCalculatorBloc bloc;
  _textFiled(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 15),
          hintText: 'Search...',
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255,3,118,77),width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          prefixIcon: Icon(Icons.search,size: 20,),
        ),
        cursorColor: const Color.fromARGB(255,3,118,77),
        controller: bloc.search_text,
        style: TextStyle(fontSize: 20,color: Color.fromARGB(255,3,118,77)) ,
        onChanged: (val){
          bloc.add(SearchEvent(val));
        },
      ),
    );
  }

}