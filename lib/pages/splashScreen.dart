import 'package:dhakar_chaka/pages/CurvedNavigationController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const colorizeColors = [
  Colors.black,
  Colors.white,
  Colors.black,
  Colors.red,
];


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CurvedNavigationController(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Dhakar Chaka',
                    speed: Duration(milliseconds: 550),
                      textStyle: GoogleFonts.redressed(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Lottie.asset('assets/bus.json', repeat: false, ),
            ),
          ],
        ),
      ),
    );
  }
}