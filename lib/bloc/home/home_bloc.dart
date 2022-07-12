import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:natural/model/user_history_model.dart';
import 'package:natural/repository/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  TextEditingController water_cup = TextEditingController();
  TextEditingController calories = TextEditingController();

  List<User_history_model> history_list=[];
  String tip ='';
  Home_repo repo = Home_repo();



  HomeBloc() : super(HomeInitial()) {
    on<FetchHistoryEvent>(_onFetchHistoryEvent);
    on<FetchTipsEvent>(_onFetchTipsEvent);
    // on<FetchMaileEvent>(_onFetchMaileEvent);
    on<AddDailyExercise>(_onAddDailyExercise);
  }

  _onFetchHistoryEvent(FetchHistoryEvent event, Emitter<HomeState> emit) async {
    emit(LoadingHistoryState());
    try {
      history_list.clear();
      history_list = await repo.Fetch_history();
      emit(FetchedHistoryState());
    } catch (e) {
      emit(FailedHistoryState(e.toString()));
    }

  }

  _onFetchTipsEvent(FetchTipsEvent event, Emitter<HomeState> emit) async {
    emit(LoadingTipState());
    try {
      tip = await repo.Fetch_tip();
      emit(FetchedTipState());
    } catch (e) {
      emit(FailedTipState(e.toString()));
    }

  }

  // _onFetchMaileEvent(FetchMaileEvent event, Emitter<HomeState> emit) async {
  //   emit(LoadingMaileState());
  //   try {
  //     // disease.clear();
  //     // disease = await repo.Fetch_disease();
  //     emit(FetchedMaileState());
  //   } catch (e) {
  //     emit(FailedMaileState(e.toString()));
  //   }
  //
  // }

  _onAddDailyExercise(AddDailyExercise event, Emitter<HomeState> emit) async {
    try {
      int water = int.parse(water_cup.text);
      int calo = int.parse(calories.text);
      User_history_model model = User_history_model(waterCup:water,
          calories: calo,Date: DateTime.now().toString().substring(0,10));
      await repo.AddDaily(model);
      //history_list.add(model);
      water_cup.text='';
      calories.text='';
      //emit(FetchedHistoryState());
      emit(AddCompleteState());
    } catch (e) {
      //print(e.toString());
      emit(AddUnCompleteState(e.toString()));
    }

  }


}

