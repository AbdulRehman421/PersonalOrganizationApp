import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../homepage.dart';
import '../main.dart';

void main() {
  runApp(k());
}

class k extends StatefulWidget {
  @override
  _kState createState() => _kState();
}

class _kState extends State<k> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyImageApp(),
    );
  }
}

class MyImageApp extends StatefulWidget {
  @override
  _MyImageAppState createState() => _MyImageAppState();
}

class _MyImageAppState extends State<MyImageApp> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyPersonalApp()));
        }, icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text("Add Images"),
      ),
      body: Center(
        child:
        Column(
          children: [
            Container(
              height: 350,
              width: 200,
              margin: EdgeInsets.only(top: 30),
              color: Colors.black12,
              child: file == null

                  ? Icon(
                Icons.image,
                size: 50,
              )
                  : Image.file(
                file!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              onPressed: () {
                getgallery();
              },
              color: Colors.blue[900],
              child: Text(
                "Pick image from gallery",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              onPressed: () {
                getcamera();
              },
              color: Colors.blue[900],
              child: Text(
                "Pick image from camera",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getcamera() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgallery() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}