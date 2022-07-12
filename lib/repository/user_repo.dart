
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natural/model/user_profile_model.dart';



class User_repo {

  Future<User_profile_model> signin(email,pass) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
     DocumentSnapshot<Map<String,dynamic>> response = await FirebaseFirestore.instance.collection('users').doc(user.user!.uid).get();
    return User_profile_model.fromJson(response.data()!);
  }

  Future signup(email,pass,User_profile_model model) async {
   UserCredential user =  await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass);
   await FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set(model.toJson());
  }

  Future forgetPassword(email) async {
    print(email);
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  
  Future get_current_user()async{
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in! $user');
      }
    });
  }


}