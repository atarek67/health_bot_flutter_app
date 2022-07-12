


import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natural/model/user_history_model.dart';

class Home_repo {

  Future<List<User_history_model>> Fetch_history() async {
    List<User_history_model> list=[];

    String uid = await FirebaseAuth.instance.currentUser!.uid;

    QuerySnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('users')
        .doc(uid).collection('history').get();

    response.docs.forEach((element) {list.add(User_history_model.fromJson(element.data(),element.id)); });
    return list;
  }

  Future<String> Fetch_tip() async {
    int temp = Random().nextInt(11);

    DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('nutrition_tips')
        .doc(temp.toString()).get();
    return response.data()!['tip'];
  }

  Future AddDaily(User_history_model model) async {

    String uid = await FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid)
        .collection('history').doc(model.Date).set(model.toJson());
  }

}