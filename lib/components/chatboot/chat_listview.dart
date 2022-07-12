import 'package:flutter/cupertino.dart';
import 'package:natural/components/chatboot/chat_message.dart';

import '../../bloc/chatboot/chatboot_bloc.dart';

class Listview extends StatelessWidget{

  ChatbootBloc bloc;
  late ScrollController scrollController;
  Listview(this.bloc);

  @override
  Widget build(BuildContext context) {

    scrollController = ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

    return Container(
      height: MediaQuery.of(context).size.height-220,
      child: ListView.builder(
        controller:scrollController,
          reverse: true,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: bloc.chatMessages.length,
          itemBuilder:(context,index){
            return ChatMessage(bloc.chatMessages[index].robot_sent_message, bloc.chatMessages[index].message);
          }),
    );
  }

}