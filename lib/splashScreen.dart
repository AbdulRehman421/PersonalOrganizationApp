import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/homepage.dart';
import 'package:flutter_complete_guide/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[ Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Image.asset('assets/images/logo.png',height: 120)),
                SizedBox(
                  width: 420.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Agne',
                    ),
                    child: AnimatedTextKit(
                      onFinished: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyPersonalApp()));
                      },
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText('Welcome to Personal Organizer System'),

                      ],
                    ),
                  ),
                )

              ]
          )
      ),
    );
  }
}
