import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
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
      backgroundColor: HexColor('#EFEEE9'),
     body:

     Column(
       children: [
         const SizedBox(height: 20,),
         _textFiled(bloc),
         BlocBuilder<MacroCalculatorBloc,MacroCalculatorState>(builder: (context, state){
             if(state is LoadingMacrostate){
               return const CircularProgressIndicator(color:  Color.fromARGB(255, 17, 138, 51),);
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
          physics: BouncingScrollPhysics(),
            itemCount:bloc.search_macro_list.length ,
            itemBuilder: (context,index){
              return Card(
                  color:const Color.fromARGB(255, 17, 138, 51),
                  shadowColor: Colors.white,
                  margin: const EdgeInsets.all(8),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ) ,
                  child: list_item(index));
            }));
  }

  Widget list_item(index){
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(bloc.search_macro_list[index].foodName!,style:const TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.bold,fontSize: 16
          ),),

          Row(
            children: [
              Column(
                children: [
                  const Text('Calories',style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 14
                  )),
                  Text(bloc.search_macro_list[index].calories!,style: const TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 14
                  ))
                ],
              ),
              const SizedBox(width: 30,),
              Column(
                children: [
                  const Text('Fat',style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 14
                  )),
                  Text(bloc.search_macro_list[index].fat!,style: const TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 14
                  ))
                ],
              ),
              const SizedBox(width: 30,),
              Column(
                children: [
                  const Text('Protein',style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 14
                  ),),
                  Text(bloc.search_macro_list[index].protein!,style: const TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,fontSize: 14
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
      padding:  EdgeInsets.all(25),
      child: TextFormField(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(right:0 ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 17, 138, 51),
            fontSize: 18.0,
          ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 17, 138, 51),width: 0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          prefixIcon: Icon(Icons.search,size: 20,color: Colors.black,),
        ),
        cursorColor: const Color.fromARGB(255, 17, 138, 51),
        controller: bloc.search_text,
        style: const TextStyle(fontSize: 13,color: Color.fromARGB(255, 17, 138, 51)) ,
        onChanged: (val){
          bloc.add(SearchEvent(val));
        },
      ),
    );
  }

}