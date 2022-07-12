import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:natural/model/daily_mail_model.dart';
import 'package:natural/model/workout_model.dart';
import 'package:natural/repository/workout_plan_repo.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {

  late Workout_repo work_repo;
  late Daily_mail_model model ;
  List<Workout_model> exercise_list=[];
  List Fats =[];
  List Fruits =[];
  List Lean_meats =[];
  List  Nonfat_milk =[];
  List  Starch =[];
  List  Vegetables =[];


  WorkoutBloc() : super(WorkoutInitial()) {
    on<FetchExerciseEvent>(_onFetchExerciseEvent);
    on<FetchPlanEvent>(_onFetchPlanEvent);
  }

  _onFetchExerciseEvent(FetchExerciseEvent event, Emitter<WorkoutState> emit) async {
    emit(LoadingExerciseState());
    try {
      exercise_list.clear();
      exercise_list = await work_repo.Fetch_exercise();
      emit(FetchedExerciseState());
    } catch (e) {
      emit(FailedExerciseState(e.toString()));
      print(e.toString());
    }

  }

  _onFetchPlanEvent(FetchPlanEvent event, Emitter<WorkoutState> emit) async {
    emit(LoadingPlanState());
    try {
      model = await work_repo.Fetch_daily_mails(event.cal);
      Fats = await work_repo.Fetch_Fats();
      Fruits = await work_repo.Fetch_Fruits();
      Lean_meats = await work_repo.Fetch_Lean_meats();
      Nonfat_milk = await work_repo.Fetch_Nonfat_milk();
      Starch = await work_repo.Fetch_Starch();
      Vegetables = await work_repo.Fetch_Vegetables();
      emit(FetchedPlanState());
    } catch (e) {
      emit(FailedPlanState(e.toString()));
      print("------"+e.toString());
    }

  }


}
