import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/splashScreen.dart';
void main(){
  runApp(MyHomePage());
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: SplashScreen(),
    ),);
  }
}
