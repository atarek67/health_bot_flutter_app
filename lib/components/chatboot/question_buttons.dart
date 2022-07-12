import 'package:flutter/material.dart';
import 'package:natural/components/button.dart';




class Question_buttons extends StatelessWidget{

  String question1;
  String question2;
  String question3;
  GestureTapCallback function1;
  GestureTapCallback function2;
  GestureTapCallback function3;
  Question_buttons(this.question1,this.question2,this.question3,this.function1,this.function2,this.function3);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Button(question1, Color.fromARGB(255,247,219,180), Colors.black, function1),
          const SizedBox(height: 10),
          Button(question2, Color.fromARGB(255,247,219,180), Colors.black, function2),
          const SizedBox(height: 10),
          Button(question3, Color.fromARGB(255,247,219,180), Colors.black, function3),
        ],
      ),
    );
  }

}