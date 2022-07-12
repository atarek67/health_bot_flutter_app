import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';




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
      dropdownColor: HexColor('#242526'),
      items: ['male','female'].map((val)=>
          DropdownMenuItem(child:Text(val),value: val,)).toList(),
      hint: const Text('Sex',style: TextStyle(color:Colors.grey),textAlign: TextAlign.center,) ,
      value: select,
      underline: Container(color: Colors.grey,height: 1,),
      style: const TextStyle(color:Color.fromARGB(255, 17, 138, 51),fontSize: 20,
          fontWeight: FontWeight.bold),
      onChanged: (val){
        setState(() {
          select = val.toString();
        });
      },
    );
  }

}