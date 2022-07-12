import 'package:flutter/material.dart';


class Check_box extends StatefulWidget{

  String title;
  final ValueSetter<bool> is_checked;
  Check_box(this.title,this.is_checked);


  @override
  State<StatefulWidget> createState() {
    return _Check_box(title);
  }

}

class _Check_box extends State<Check_box>{

  bool checked=false;
  String title;

  _Check_box(this.title);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(title),
      value: checked,
      activeColor:Color.fromARGB(255, 3, 118, 77) ,
      onChanged: (value) {
        setState(() {
          checked = !checked;
          widget.is_checked(checked);
        });
      },
    );
  }

}