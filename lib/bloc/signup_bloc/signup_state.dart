part of 'signup_bloc.dart';

abstract class SignupState  {

}

class SignupInitial extends SignupState {}

//----------signin states--------------------
class Signinloading extends SignupState{}

class Signinloaded extends SignupState{
  final String message;
  Signinloaded(this.message);
}

class SigninFail extends SignupState{
  final String error;
  SigninFail(this.error);
}

//----------forget password states--------------------
class forget_passwordLoading extends SignupState{}

class forget_passwordLoaded extends SignupState{
  final String message;
  forget_passwordLoaded(this.message);
}

class forget_passwordFail extends SignupState{
  final String error;
  forget_passwordFail(this.error);
}

//-------------signup states-------------\\

//--------personal info page------------
class Pesronal_info_completed extends SignupState{}

class Pesronal_info_uncompleted extends SignupState{
  final String error;
  Pesronal_info_uncompleted(this.error);
}

class Select_birthDate extends SignupState{
  final String date;
  Select_birthDate(this.date);
}

//------------fat history-----------
class fat_history_completed extends SignupState{}

class fat_history_uncompleted extends SignupState{
  final String error;
  fat_history_uncompleted(this.error);
}

class Show_ChronicDiseaseState extends SignupState{
  bool is_visible;
  Show_ChronicDiseaseState(this.is_visible);
}
//--------signup ---------------
class Signuploading extends SignupState{}

class SignupUploaded extends SignupState{
  final String message;
  SignupUploaded(this.message);
}

class SignupFail extends SignupState{
  final String error;
  SignupFail(this.error);
}




