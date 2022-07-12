import 'package:flutter/material.dart';


class Text_filled extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  bool password;
  TextInputType keyboard_type;
  Text_filled(this.text_controller,this.hint,this.password,{this.keyboard_type = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15),
            prefixIconColor:const Color.fromARGB(255,3,118,77) ,
            focusColor: const Color.fromARGB(255,3,118,77),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
            focusedBorder:const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255,3,118,77))
            ) ,
            // prefixIcon: password ? GestureDetector(
            //   child:  const Icon(Icons.remove_red_eye_outlined),
            //   onTap: () {
            //     // login_controller.show_pass.value = !login_controller.show_pass.value;
            //     // print(login_controller.show_pass.value);
            //   },
            // ):const Icon(Icons.person),
            labelText: hint,
            labelStyle: TextStyle(color:Colors.grey),
            floatingLabelStyle:TextStyle(color: Color.fromARGB(255,3,118,77))
        ),
        keyboardType:keyboard_type ,
        cursorColor: Color.fromARGB(255,3,118,77),
        obscuringCharacter: '*',
        obscureText: password,
        controller: text_controller,
        style: TextStyle(fontSize: 20,color: Color.fromARGB(255,3,118,77)) ,
      ),
    );
  }

}