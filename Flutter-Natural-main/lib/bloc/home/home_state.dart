part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class History extends HomeState{}
abstract class Tip extends HomeState{}
abstract class Maile extends HomeState{}

class HomeInitial extends HomeState {}



//------fetch history---
class LoadingHistoryState extends History{}

class FetchedHistoryState extends History{}

class FailedHistoryState extends History{
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

//------fetch maile---
class LoadingMaileState extends HomeState{}

class FetchedMaileState extends HomeState{}

class FailedMaileState extends HomeState{
  String error;
  FailedMaileState(this.error);
}
