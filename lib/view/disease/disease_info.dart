import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:natural/model/disease_model.dart';



class Disease_info extends StatelessWidget{

  Disease_model model;
  Disease_info(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EFEEE9'),
      appBar: AppBar(
        title: Text(model.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(child: Text(model.description!,
          style: const TextStyle(color: Colors.black87, fontSize: 20,fontWeight: FontWeight.w700),
          ),),
        ),
      ),
    );
  }

}