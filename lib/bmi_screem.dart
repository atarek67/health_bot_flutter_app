import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'bmi_result.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  int weight = 70;
  double height = 150.0;
  bool isMale=true;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EFEEE9'),
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
      body: Column(
        children: [

          //1.0
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){

                        setState(() {

                          isMale=true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const [
                            Image(
                              image: AssetImage('assets/male.png'),
                              height:100.0,
                              width: 100.0,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color:isMale? Color.fromARGB(255, 17, 138, 51) : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const [
                            Image(
                              image: AssetImage('assets/f.png'),
                              height:100.0,
                              width: 100.0,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color:isMale? Colors.grey[400] : Color.fromARGB(255, 17, 138, 51) ,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),//1.0

          //2.0
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),//Height
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4.0,),
                        const Text(
                          'CM',
                          style:  TextStyle(
                            color: Colors.black87,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),//180cm
                    Slider(
                      value: height,
                      max: 220.0,
                      min: 80.0,
                      onChanged:(value)
                      {
                        setState(() {
                          height=value;
                        });
                      },),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0,),
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),//2.0

          //3.0
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(

                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                backgroundColor:Color.fromARGB(255, 17, 138, 51),
                                heroTag: 'weight-',
                                mini: true,
                                child:const Icon(
                                  Icons.remove,
                                ),
                              ),
                              const SizedBox(width: 2.0,),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: Color.fromARGB(255, 17, 138, 51),
                                heroTag: 'weight+',
                                mini: true,
                                child:const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                backgroundColor: Color.fromARGB(255, 17, 138, 51),
                                heroTag: 'age-',
                                mini: true,
                                child:const Icon(
                                  Icons.remove,
                                ),
                              ),
                              const SizedBox(width: 2.0,),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor:Color.fromARGB(255, 17, 138, 51),
                                heroTag: 'age+',
                                mini: true,
                                child:const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),//3.0

          //4.0
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              height: 50.0,
              color: Color.fromARGB(255, 17, 138, 51),
              onPressed: (){
                var result = weight / (pow(height / 100,2));
                print(result.round());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=> BmiResultScreen(
                      age:age,
                      isMale:isMale,
                      result:result.round(),
                    ),
                  ),
                );
              },
              child:const Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),//4.0
        ],
      ),
    );
  }
}
