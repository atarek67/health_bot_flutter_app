import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:natural/model/disease_model.dart';
import 'package:natural/model/macro_calculator_model.dart';
import 'package:natural/repository/macro_calculator_repo.dart';

part 'macro_calculator_event.dart';
part 'macro_calculator_state.dart';

class MacroCalculatorBloc extends Bloc<MacroCalculatorEvent, MacroCalculatorState> {

 late List<Macro_calculator_model> macro_list=[];
 late List<Macro_calculator_model> search_macro_list=[];
 late List<Disease_model> disease =[];

 Macro_disease_repo repo = Macro_disease_repo();

 TextEditingController search_text = TextEditingController();

  MacroCalculatorBloc() : super(MacroCalculatorInitial()) {
    on<FetchMacroEvent>(_onFetchMacroEvent);
    on<SearchEvent>(_onSearchEvent);
    on<FetchDiseaseEvent>(_onFetchDiseaseEvent);
  }

  _onFetchMacroEvent(FetchMacroEvent event, Emitter<MacroCalculatorState> emit) async {
    emit(LoadingMacrostate());
    try {
      macro_list.clear();
      search_macro_list.clear();
      macro_list = await repo.Fetch_macro();
      search_macro_list.addAll(macro_list);
      emit(FetchedMacroState());
    } catch (e) {
      emit(FailedMacroState(e.toString()));
    }

  }

 _onSearchEvent(SearchEvent event, Emitter<MacroCalculatorState> emit) async {
   try {
     search_macro_list.clear();
     if(event.search.isNotEmpty)
        search_macro_list.addAll(macro_list.where((element) => element.foodName!.contains(event.search)));
     else
       search_macro_list.addAll(macro_list);

     emit(FetchedMacroState());
   } catch (e) {
     emit(FailedMacroState(e.toString()));
   }

 }

 _onFetchDiseaseEvent(FetchDiseaseEvent event, Emitter<MacroCalculatorState> emit) async {
   emit(LoadingMacrostate());
   try {
     disease.clear();
     disease = await repo.Fetch_disease();
     emit(FetchedMacroState());
   } catch (e) {
     emit(FailedMacroState(e.toString()));
   }

 }


}
