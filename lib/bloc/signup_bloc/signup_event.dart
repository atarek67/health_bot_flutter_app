part of 'signup_bloc.dart';

abstract class SignupEvent  {}

class SigninEvent extends SignupEvent{}

class forget_passwordEvent extends SignupEvent{}

class SelectTimeEvent extends SignupEvent{
  String date;
  SelectTimeEvent(this.date);
}

class Show_ChronicDiseaseEvent extends SignupEvent{
  bool is_visible;
  Show_ChronicDiseaseEvent(this.is_visible);
}

class CreateUserEvent extends SignupEvent{}

class CheckPersonalInfo extends SignupEvent{}

class CheckFatHistory extends SignupEvent{}
