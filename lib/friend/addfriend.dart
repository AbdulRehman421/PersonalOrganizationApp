import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../homepage.dart';
import '../main.dart';
import 'friendDatabase.dart';
import 'friendmodelclass.dart';

class NewFriend extends StatefulWidget {

  @override
  _NewFriendState createState() => _NewFriendState();
}

class _NewFriendState extends State<NewFriend> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String selectGender = 'male';


  DBHelper? dbHelper;

  _validation(){
    if(formKey.currentState!.validate()){
      Fluttertoast.showToast(msg: "You can Add Your Friend");
      print("You can add you Friend");
      print("name ${_nameController.text}");
      print("age ${_ageController.text}");
      print("gender ${selectGender}");
      dbHelper?.insert(
          FriendModelClass(
            name: _nameController.text.toString(),
            age: int.parse(_ageController.text.toString()),
            gender: selectGender,
          )
      ).then((value) {
        print("Data Added");
        Fluttertoast.showToast(msg: "Data Added");
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }else{
      Fluttertoast.showToast(msg: 'Please Provide the required information');
      print("Enter The Information in the Textfields");
    }
  }






  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue.shade50,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.withOpacity(0.8),
        title: const Text(
          "Add New Friend",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                          controller: _nameController,
                          // onTap: _submitData,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Provide Your Amount";
                            }
                            return null;
                          }               // onChanged: (val) {
                        //   titleInput = val;
                        // },
                      ),
                      TextFormField(
                          decoration: InputDecoration(labelText: 'Age'),
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          // onTap: _submitData,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Provide Your Amount";
                            }
                            return null;
                          }
                        // onChanged: (val) => amountInput = val,
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Select Gender', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                              ListTile(
                                leading: Radio<String>(
                                  value: 'male',
                                  groupValue: selectGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectGender = value.toString();
                                    });
                                  },
                                  activeColor: Colors.redAccent,
                                ),
                                title: const Text('Male'),
                              ),
                              ListTile(
                                leading: Radio<String>(
                                  value: 'female',
                                  groupValue: selectGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectGender = value.toString();
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                title: const Text('Female'),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                child: MaterialButton(
                                  color: Colors.blue,
                                  onPressed: (){
                                    _validation();
                                   Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => FriendDbList()));
                                  },
                                  shape: const StadiumBorder(),
                                  child: const Text("Add Friend", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
    ),
    ),
    ),
        ],
    )
    )
    );
  }
}