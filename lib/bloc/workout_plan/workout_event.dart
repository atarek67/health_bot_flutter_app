part of 'workout_bloc.dart';

@immutable
abstract class WorkoutEvent {}

class FetchExerciseEvent extends WorkoutEvent{}


class FetchPlanEvent extends WorkoutEvent{
  String cal ;
  FetchPlanEvent(this.cal);
}

