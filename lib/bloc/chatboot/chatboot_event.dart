part of 'chatboot_bloc.dart';

@immutable
abstract class ChatbootEvent {}

class CaloriseEvent extends ChatbootEvent{}

//-----programs---------
class ProgramsEvent extends ChatbootEvent{}

class LowEvent extends ChatbootEvent{}

class MediumEvent extends ChatbootEvent{}

class HardEvent extends ChatbootEvent{}


//-----feeling-------
class FeelingEvent extends ChatbootEvent{}

class HappyEvent extends ChatbootEvent{}

class sadEvent extends ChatbootEvent{}

class lazyEvent extends ChatbootEvent{}
