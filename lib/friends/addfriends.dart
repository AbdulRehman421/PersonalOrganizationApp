import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'friendsdatabase.dart';
import 'friendsdblist.dart';
import 'friendsmodelclass.dart';



class AddFriendsScreen extends StatefulWidget {

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {

late File _image;
Future getImage() async{
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image ==null) return;
  final imageTemporary = File(image.path);
  setState(() {
    this._image = imageTemporary;
  });
}
  String selectGender = 'male';
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  late FriendsDBHelper dbHelper;


  validation(){
    if(formKey.currentState!.validate()){
      Fluttertoast.showToast(msg: "You can Add Your friend");
      print("You can add you friend");
      dbHelper.insert(
          FriendsModelClass(
            fname: firstNameController.text.toString(),
            lname: lastNameController.text.toString(),
            age: int.parse(ageController.text.toString()),
            address: addressController.text.toString(),
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
    super.initState();
    dbHelper = FriendsDBHelper();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: const Text("Add Friends", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  FriendsListScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: GestureDetector(
                  onTap: (){
                    getImage();
                  },
                  child: Image.asset('assets/images/person1.png',height: 100,)),
            ),
            const SizedBox(height: 12.0,),
            const Padding(
              padding: EdgeInsets.only(left: 150.0),
              child: Text("Upload Image", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),),
            ),
            const SizedBox(height: 40,),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: firstNameController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Provide Your FirstName";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter First Name",
                          hintStyle: TextStyle(color: Colors.black,),
                          labelText: "First Name",
                          labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          border: UnderlineInputBorder(),

                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: lastNameController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Provide Your Last Name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Last Name",
                          hintStyle: TextStyle(color: Colors.black,),
                          labelText: "Last Name",
                          labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),


                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: ageController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Provide Your Age";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Enter Your Age",
                          hintStyle: TextStyle(color: Colors.black,),
                          labelText: "Age",
                          labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),

                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: addressController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Provide Your Address";
                        }
                        return null;
                      },
                      maxLines: 3,
                      decoration: const InputDecoration(
                          hintText: "Enter Your Address",
                          hintStyle: TextStyle(color: Colors.black,),
                          labelText: "Address",
                          labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),

                      ),
                    ),
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
                                  selectGender = value!;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            title: const Text('Male'),
                          ),
                          ListTile(
                            leading: Radio<String>(
                              value: 'female',
                              groupValue: selectGender,
                              onChanged: (value) {
                                setState(() {
                                  selectGender = value!;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            title: const Text('Female'),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  validation();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FriendsListScreen()));
                },
                shape: const StadiumBorder(),
                child: const Text("Add Friend", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}