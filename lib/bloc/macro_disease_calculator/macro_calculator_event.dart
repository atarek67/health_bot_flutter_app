part of 'macro_calculator_bloc.dart';

@immutable
abstract class MacroCalculatorEvent {}

class FetchMacroEvent extends MacroCalculatorEvent{}

class SearchEvent extends MacroCalculatorEvent{
  String search;
  SearchEvent(this.search);
}

class FetchDiseaseEvent extends MacroCalculatorEvent{}