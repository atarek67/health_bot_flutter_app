import 'package:flutter/material.dart';


class Button extends StatelessWidget{

  String text;
  GestureTapCallback function;
  Color background_color;
  Color text_color;
  //double width_size;

  Button(this.text,this.background_color,this.text_color,this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
         width: MediaQuery.of(context).size.width-50,
        //height: ,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: background_color
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: 20,
            color: text_color,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)) ,
      ),
      onTap: function,
    );
  }

}