import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:natural/bloc/signup_bloc/signup_bloc.dart';
import 'package:natural/model/user_profile_model.dart';
import 'package:natural/view/signin.dart';




class Profile_info extends StatelessWidget{

  late SignupBloc bloc;

  @override
  Widget build(BuildContext context) {

    bloc = BlocProvider.of<SignupBloc>(context);

    return Scaffold(
        backgroundColor: HexColor('#EFEEE9'),
      body:SizedBox(
        height:MediaQuery.of(context).size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Draw_page_header(bloc.user_model),
              _Show_user_info(bloc.user_model)
            ],
          ),
      )
    );
  }

}

class _Show_user_info extends StatelessWidget{

  User_profile_model _user_details_model;
  _Show_user_info(this._user_details_model);

  @override
  Widget build(BuildContext context) {
    return Expanded(


      child: ListView(
        children: [
          _show_Text(_user_details_model.currentWeight!.toString(),"Current Weight"),
          _show_Text(_user_details_model.birthDate!,"BirthDate"),
          _show_Text(_user_details_model.long!.toString(),"Height"),
          _show_Text(_user_details_model.sex!,"Sex"),
          _show_Text(_user_details_model.goalWeight!.toString(),"Goal Weight"),
          _show_Text(_user_details_model.dailyCalorise!.toString(),"Daily Calories"),
          _show_Text(_user_details_model.doNaturalPlanBefore.toString(),"Do You Have Natural Plan Before ? "),
          _show_Text(_user_details_model.haveChronicDisease.toString(),"Do You Have Chronic Disease ? "),
          const SizedBox(height: 30,),
          _user_details_model.haveChronicDisease?const Text('Chronic Disease',
            style: TextStyle(color: Color.fromARGB(255, 17, 138, 51),fontSize: 20,fontWeight: FontWeight.bold),):Container(),
          _user_details_model.haveChronicDisease?Padding(padding: const EdgeInsets.all(20),
             child: SizedBox(
               height: 100,
               child: ListView(
                 children:_user_details_model.chronic_disease!.keys.map((e) => _disease_Text('True',e)).toList() ,
               ),
             ),
          ):Container(),
          TextButton(
            child: const Text('Sign Out',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              onPressed: (){
                BlocProvider.of<SignupBloc>(context).emit(SignupInitial());
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    Signin()), (Route<dynamic> route) => false);
              }),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget _show_Text(String title, String text){
    //return Text(text,style: TextStyle(color:Color(0xff005194),),);
    return ListTile(
      title:Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(text,style: const TextStyle(color:Color.fromARGB(255, 17, 138, 51),fontSize: 20,fontWeight: FontWeight.bold),),
      ) ,
      subtitle:Text(title,style: const TextStyle(color:Color.fromARGB(255, 17, 138, 51),fontSize: 20),) ,
    );
  }

  Widget _disease_Text(String title, String text){
    //return Text(text,style: TextStyle(color:Color(0xff005194),),);
    return ListTile(
      title:Text(text,style: const TextStyle(color:Color.fromARGB(255, 17, 138, 51),fontSize: 20,fontWeight: FontWeight.bold),) ,
      trailing:Text(title,style: const TextStyle(color:Color.fromARGB(255, 17, 138, 51),fontSize: 20),) ,
    );
  }

}

class _Draw_page_header extends StatelessWidget{

  User_profile_model _user_details_model;
  _Draw_page_header(this._user_details_model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
     width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 17, 138, 51),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)
          )
      ),
      child: Column(
        children: [
          const SizedBox(height: 30,),
          CircleAvatar(backgroundImage: _user_details_model.sex=='male'?const AssetImage('assets/man.jpg'):const AssetImage('assets/women.jpg'),
            radius: 70 ,backgroundColor: Colors.white,),
          const SizedBox(height: 20,),
          Text(_user_details_model.name!,style: const TextStyle(fontSize: 25,
              color: Colors.white,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

}
