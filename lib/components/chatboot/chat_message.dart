import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget{

  bool messageFromRopot;
  String message;
  ChatMessage(this.messageFromRopot,this.message);

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
        child: Align(
          alignment: (messageFromRopot?Alignment.topLeft:Alignment.topRight),
          child:
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(17),
                bottomLeft:  Radius.circular(5),
                bottomRight:  Radius.circular(5),
              ),
              color: messageFromRopot? (Colors.black45):const Color.fromARGB(255, 17, 138, 51),
            ),
            padding: EdgeInsets.all(16),
            child: Text(message, style: TextStyle(fontSize: 15,color: Colors.white)),)
          ),
        );

  }

}