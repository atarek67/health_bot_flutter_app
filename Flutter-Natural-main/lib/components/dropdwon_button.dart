import 'package:flutter/material.dart';




class Dropdwon_button extends StatefulWidget{

  _Dropdwon_button _button = _Dropdwon_button();

  @override
  State<StatefulWidget> createState() {
    return _button;
  }
  String selected (){
    print(_button.select!);
    return _button.select!;
  }
}

class _Dropdwon_button extends State<Dropdwon_button>{

  String ?select;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: ['male','female'].map((val)=>
          DropdownMenuItem(child:Text(val),value: val,)).toList(),
      hint: const Text('Sex',style: TextStyle(color:Colors.black45),textAlign: TextAlign.center,) ,
      value: select,
      underline: Container(color: Colors.black45,height: 1,),
      style: const TextStyle(color:Color.fromARGB(255, 3, 118, 77),fontSize: 20,
          fontWeight: FontWeight.bold),
      onChanged: (val){
        setState(() {
          select = val.toString();
        });
      },
    );
  }

}