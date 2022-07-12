import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural/model/user_profile_model.dart';
import 'package:natural/repository/user_repo.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {

  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  TextEditingController user_name = TextEditingController();
  //TextEditingController sex = TextEditingController();
  TextEditingController long = TextEditingController();
  TextEditingController current_weight = TextEditingController();
  TextEditingController goal_weight = TextEditingController();

  String birth_date = 'Birth Date';
  String sex ='';
  Map<String,bool> chronic_disease ={};

  late User_profile_model user_model;

  User_repo repo = User_repo();

  SignupBloc() : super(SignupInitial()){
    on<SigninEvent>(_onSigninEvent);   // login
    on<forget_passwordEvent>(_onforget_passwordEvent); //forget password
    on<SelectTimeEvent>(_onSelectTimeEvent);  //select birth date
    on<CheckPersonalInfo>(_onCheckPersonalInfo);  //add personal info to user model
    on<Show_ChronicDiseaseEvent>(_onShow_ChronicDiseaseEvent);  //visibility of disease list
    on<CheckFatHistory>(_onCheckFatHistory);
    on<CreateUserEvent>(_onCreateUserEvent);
  }

   _onSigninEvent(SigninEvent event, Emitter<SignupState> emit) async {
     emit(Signinloading());
     try {
       user_model = await repo.signin(email_controller.text,pass_controller.text);
       emit(Signinloaded('signed successfully'));
     } catch (e) {
       emit(SigninFail(e.toString()));
       emit(SignupInitial());
     }

  }

  _onforget_passwordEvent(forget_passwordEvent event, Emitter<SignupState> emit) async {
    emit(forget_passwordLoading());
    try {
      await repo.forgetPassword(email_controller.text);
      emit(forget_passwordLoaded('Send Mail successfully'));
      emit(SignupInitial());
    } catch (e) {
      print(e);
      emit(forget_passwordFail(e.toString()));
      emit(SignupInitial());
    }

  }


  _onSelectTimeEvent(SelectTimeEvent event,Emitter<SignupState> emit ) {
    birth_date = event.date;
    emit(Select_birthDate(event.date));
  }

  _onShow_ChronicDiseaseEvent(Show_ChronicDiseaseEvent event,Emitter<SignupState> emit ) {
    user_model.haveChronicDisease =event.is_visible;
    emit(Show_ChronicDiseaseState(event.is_visible));
  }

  _onCheckPersonalInfo(CheckPersonalInfo event,Emitter<SignupState> emit ) {

       try{
         if(check_personalinfo_fields()){
         set_personalinfo_in_model();
         emit(Pesronal_info_completed());
         }else{
           emit(Pesronal_info_uncompleted('Should Fill All Fields'));
         }
       }catch(e){
         emit(Pesronal_info_uncompleted('Height & Weight should be number'));
       }

  }

  _onCheckFatHistory(CheckFatHistory event,Emitter<SignupState> emit ) {

    try{
      if(goal_weight.text.isNotEmpty){
        set_fat_history_in_model();
        emit(fat_history_completed());
      }else{
        emit(fat_history_uncompleted('Fill Goal Weight'));
      }
    }catch(e){
      emit(fat_history_uncompleted('Weight should be number'));
    }

  }

  _onCreateUserEvent(CreateUserEvent event, Emitter<SignupState> emit) async {
    emit(Signuploading());
    try {
      await set_daily_calories(Culculate_calories());
      await repo.signup(email_controller.text,pass_controller.text,user_model);
      emit(SignupUploaded('signed successfully'));
      emit(SignupInitial());
    } catch (e) {
      emit(SigninFail(e.toString()));
      emit(SignupInitial());
    }

  }

  int Culculate_calories(){

    int year = int.parse(user_model.birthDate!.split('-')[0]);
    double age = (DateTime.now().difference(DateTime(year)).inDays)/365;
    double BMR = 0;
    if(sex == 'male'){
      BMR = 66.47+(13.75*user_model.currentWeight!)+(5.003*user_model.long!)-(6.755*age);

    }else{
      BMR = 655.1+(9.563*user_model.currentWeight!)+(1.85*user_model.long!)-(4.676*age);
    }
    return (BMR * 1.55).toInt();
  }

  set_daily_calories(int calorise){
    if(user_model.goalWeight! >= user_model.currentWeight!){
      user_model.dailyCalorise = calorise+300;
    }else{
      user_model.dailyCalorise = calorise-500;
    }
  }

  bool check_personalinfo_fields(){
    if(user_name.text.isEmpty) {
      return false;
    }else if(sex.isEmpty){
      return false;
    }else if(long.text.isEmpty){
      return false;
    }else if(current_weight.text.isEmpty){
      return false;
    }else if(birth_date == 'Birth Date'){
      return false;
    }

    return true;
  }

  set_personalinfo_in_model(){
    user_model = User_profile_model(
        name: user_name.text,
        sex: sex,
        long: double.parse(long.text),
        currentWeight: double.parse(current_weight.text),
        birthDate: birth_date
    );

  }

  set_fat_history_in_model(){
    user_model.goalWeight = double.parse(goal_weight.text);
    user_model.chronic_disease=chronic_disease;
  }

}


