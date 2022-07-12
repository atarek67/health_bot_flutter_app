

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:natural/model/disease_model.dart';
import 'package:natural/model/macro_calculator_model.dart';

class Macro_disease_repo {

  Future <List<Macro_calculator_model>> Fetch_macro() async {
    List<Macro_calculator_model> list =[];
    QuerySnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('macro_calculator').get();
    response.docs.forEach((element) {list.add(Macro_calculator_model.fromJson(element.data())); });
    return list;
  }

  Future <List<Disease_model>> Fetch_disease() async {
    List<Disease_model> list =[];
    QuerySnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('disease_info').get();
    response.docs.forEach((element) {list.add(Disease_model.fromJson(element.data())); });
    return list;
  }
  
}