
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:natural/model/chatboot_model.dart';

part 'chatboot_event.dart';
part 'chatboot_state.dart';

class ChatbootBloc extends Bloc<ChatbootEvent, ChatbootState> {

  List<Chatboot_model> chatMessages=[Chatboot_model('Hi,How Can I Help You ?', true)];


  ChatbootBloc() : super(ChatbootInitial()) {
    on<FeelingEvent>(_onFeelingEvent);
    on<HappyEvent>(_onHappyEvent);
    on<sadEvent>(_onsadEvent);
    on<lazyEvent>(_onlazyEvent);

    on<ProgramsEvent>(_onProgramsEvent);
    on<LowEvent>(_onLowEvent);
    on<MediumEvent>(_onMediumEvent);
    on<HardEvent>(_onHardEvent);


    on<CaloriseEvent>(_onCaloriseEvent);
  }

  //------calories-------------------
  _onCaloriseEvent(CaloriseEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model('Calories', false));
    chatMessages.insert(0,Chatboot_model('How Can I Help You ?', true));
    emit(Rebuild_messages_list_state());

  }
//-----------feeling-------------------------
  _onFeelingEvent(FeelingEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model('Feeling', false));
    chatMessages.insert(0,Chatboot_model('Can You Choose Your Feeling Now?', true));
    emit(Rebuild_messages_list_state());

  }

  _onHappyEvent(HappyEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model('Happy', false));
    chatMessages.insert(0,Chatboot_model('quote......', true));
    chatMessages.insert(0,Chatboot_model('How Can I Help You ?', true));
    emit(Rebuild_messages_list_state());

  }

  _onsadEvent(sadEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model('Sad', false));
    chatMessages.insert(0,Chatboot_model('eat some mango', true));
    chatMessages.insert(0,Chatboot_model('How Can I Help You ?', true));
    emit(Rebuild_messages_list_state());

  }
  _onlazyEvent(lazyEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model('Lazy', false));
    chatMessages.insert(0,Chatboot_model('How Can I Help You ?', true));
    emit(Rebuild_messages_list_state());

  }


  //-----programs ------------------------
  _onProgramsEvent(ProgramsEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model('Available Programs', false));
    chatMessages.insert(0,Chatboot_model('Can You Choose A Program You Need To Know?', true));
    emit(Rebuild_messages_list_state());
  }

  _onLowEvent(LowEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model(' Program 1000 Calories ', false));
    chatMessages.insert(0,Chatboot_model('How Can I Help You ?', true));
    emit(Rebuild_messages_list_state());
  }

  _onMediumEvent(MediumEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model(' Program 2000 Calories ', false));
    chatMessages.insert(0,Chatboot_model('How Can I Help You ?', true));
    emit(Rebuild_messages_list_state());
  }

  _onHardEvent(HardEvent event, Emitter<ChatbootState> emit){
    chatMessages.insert(0,Chatboot_model(' Program 3000 Calories ', false));
    chatMessages.insert(0,Chatboot_model('How Can I Help You ?', true));
    emit(Rebuild_messages_list_state());
  }



}
