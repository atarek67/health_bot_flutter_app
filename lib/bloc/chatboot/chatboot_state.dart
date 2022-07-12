part of 'chatboot_bloc.dart';

@immutable
abstract class ChatbootState {}

class ChatbootInitial extends ChatbootState {}



class Rebuild_messages_list_state extends ChatbootState{}

//-------feeling states----------
class FeelingState extends ChatbootState{}

class HappyState extends ChatbootState{}

class sadState extends ChatbootState{}

class lazyState extends ChatbootState{}


//---------programs state------------
class ProgramsState extends ChatbootState{}

class LowState extends ChatbootState{}

class MediumState extends ChatbootState{}

class HardState extends ChatbootState{}
