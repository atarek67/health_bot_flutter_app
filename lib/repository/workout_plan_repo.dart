




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:natural/model/daily_mail_model.dart';
import 'package:natural/model/workout_model.dart';

class Workout_repo {

  Future <List<Workout_model>> Fetch_exercise() async {
    List<Workout_model> list =[];
    QuerySnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('work_out').get();
    response.docs.forEach((element) {list.add(Workout_model.fromJson(element.data())); });
    return list;
  }

  Future <Daily_mail_model> Fetch_daily_mails(String cal) async {
    QuerySnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('daily_mail')
        .where('cal',isGreaterThanOrEqualTo: cal).get();
    if(response.docs.isNotEmpty)
      return Daily_mail_model.fromJson(response.docs[0].data());

    return Daily_mail_model();
  }

  Future <List> Fetch_Fats() async {
    DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('mails').doc('Fats').get();
    return response.data()!['data'];
  }

  Future <List> Fetch_Fruits() async {
    DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('mails').doc('Fruits').get();
    return response.data()!['data'];
  }

  Future <List> Fetch_Lean_meats() async {
    DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('mails').doc('Lean meats').get();
    return response.data()!['data'];
  }

  Future <List> Fetch_Nonfat_milk() async {
    DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('mails').doc('Nonfat milk').get();
    return response.data()!['data'];
  }

  Future <List> Fetch_Starch() async {
    DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('mails').doc('Starch').get();
    return response.data()!['data'];
  }

  Future <List> Fetch_Vegetables() async {
    DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('mails').doc('Vegetables').get();
    return response.data()!['data'];
  }


}