import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class BmiResultScreen extends StatelessWidget {

  final int result;
  final bool isMale;
  final int age;
  const BmiResultScreen({Key? key, required this.result, required this.isMale, required this.age}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EFEEE9'),
      appBar: AppBar(
        title: const Text(
          'Results',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${isMale ? 'Male ' : 'Female'}',
              style:const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Age: $age',
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Result: $result',
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            Image(
              image: AssetImage('assets/bmi2.png'),
              height:400.0,
              width: 400.0,
            ),

          ],
        ),
      ),
    );
  }
}
