import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class ChatMessage extends StatelessWidget{

  bool messageFromRopot;
  String message;
  ChatMessage(this.messageFromRopot,this.message);

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(left: 14,right: 14,top: 8,bottom: 7),
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
              color: messageFromRopot? HexColor('#595E60'):const Color.fromARGB(255, 17, 138, 51),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(message, style: const TextStyle(fontSize: 17,color: Colors.white)),)
          ),
        );

  }

}