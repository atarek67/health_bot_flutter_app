import 'package:flutter/material.dart';


class Text_filled extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  bool password;
  TextInputType keyboard_type;
  Text_filled(this.text_controller,this.hint,this.password,{Key? key, this.keyboard_type = TextInputType.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30),
      child: TextFormField(
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 15),
            prefixIconColor:const Color.fromARGB(255, 17, 138, 51) ,
            focusColor: const Color.fromARGB(255, 17, 138, 51),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
            focusedBorder:const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 17, 138, 51))
            ) ,
            // prefixIcon: password ? GestureDetector(
            //   child:  const Icon(Icons.remove_red_eye_outlined),
            //   onTap: () {
            //     // login_controller.show_pass.value = !login_controller.show_pass.value;
            //     // print(login_controller.show_pass.value);
            //   },
            // ):const Icon(Icons.person),
            labelText: hint,
            labelStyle:const TextStyle(color:Colors.grey),
            floatingLabelStyle:const TextStyle(color: Color.fromARGB(255, 17, 138, 51))
        ),
        keyboardType:keyboard_type ,
        cursorColor:const Color.fromARGB(255, 17, 138, 51),
        obscuringCharacter: '*',
        obscureText: password,
        controller: text_controller,
        style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 17, 138, 51)) ,
      ),
    );
  }

}