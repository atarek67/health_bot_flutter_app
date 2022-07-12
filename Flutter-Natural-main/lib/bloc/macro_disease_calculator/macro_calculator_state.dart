part of 'macro_calculator_bloc.dart';

@immutable
abstract class MacroCalculatorState {}

class MacroCalculatorInitial extends MacroCalculatorState {}

//-------fetch macro&disease calculator------------------
class LoadingMacrostate extends MacroCalculatorState{}

class FetchedMacroState extends MacroCalculatorState{}

class FailedMacroState extends MacroCalculatorState{
  String error;
  FailedMacroState(this.error);
}


