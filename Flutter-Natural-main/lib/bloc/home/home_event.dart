part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchHistoryEvent extends HomeEvent{}

class FetchTipsEvent extends HomeEvent{}

class FetchMaileEvent extends HomeEvent{}


