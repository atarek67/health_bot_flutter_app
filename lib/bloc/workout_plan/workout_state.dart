part of 'workout_bloc.dart';

@immutable
abstract class WorkoutState {}

class WorkoutInitial extends WorkoutState {}

//----------fetch workout---------------
class LoadingExerciseState extends WorkoutState{}

class FetchedExerciseState extends WorkoutState{}

class FailedExerciseState extends WorkoutState{
  String error;
  FailedExerciseState(this.error);
}


//----------fetch plan---------------
class LoadingPlanState extends WorkoutState{}

class FetchedPlanState extends WorkoutState{}

class FailedPlanState extends WorkoutState{
  String error;
  FailedPlanState(this.error);
}
