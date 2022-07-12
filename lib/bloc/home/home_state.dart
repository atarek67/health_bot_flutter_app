part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}



//------fetch history---
class LoadingHistoryState extends HomeState{}

class FetchedHistoryState extends HomeState{}

class FailedHistoryState extends HomeState{
  String error;
  FailedHistoryState(this.error);
}

//------fetch tips---
class LoadingTipState extends HomeState{}

class FetchedTipState extends HomeState{}

class FailedTipState extends HomeState{
  String error;
  FailedTipState(this.error);
}

// //------fetch maile---
// class LoadingMaileState extends HomeState{}
//
// class FetchedMaileState extends HomeState{}
//
// class FailedMaileState extends HomeState{
//   String error;
//   FailedMaileState(this.error);
// }

//-----------add daily exercise ------------
class AddCompleteState extends HomeState{}

class AddUnCompleteState extends HomeState{
  String error;
  AddUnCompleteState(this.error);
}
