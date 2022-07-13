import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'components/constants/constants.dart';


class CustomAnimatedSplash extends StatelessWidget {
  Widget nextWidget;
  CustomAnimatedSplash(this.nextWidget, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 'assets/IMG-20220711-WA0070-removebg-preview.png',
        //pageTransitionType: PageTransitionType.bottomToTop,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 200,
        duration: 2500,
        centered: true,
        backgroundColor: HexColor('#EFEEE9'),
        nextScreen: nextWidget
    );
  }
}
