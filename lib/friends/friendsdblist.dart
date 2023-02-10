import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../ToDoTask/maintask.dart';
import 'addfriends.dart';
import 'friendsdatabase.dart';
import 'friendsmodelclass.dart';


class FriendsListScreen extends StatefulWidget {

  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {


   TextEditingController firstNameController = TextEditingController();
   TextEditingController lastNameController = TextEditingController();
   TextEditingController ageController = TextEditingController();
   TextEditingController addressController = TextEditingController();



  late Future<List<FriendsModelClass>> friendsList;
  late FriendsDBHelper dbHelper;
  String selectGender = 'male';

  @override
  void initState() {
    super.initState();
    dbHelper = FriendsDBHelper();
    loadData();
  }

  loadData() async{
    friendsList = dbHelper.getCartListWithUserId();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Friends List", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
      ),


      body : Column(
        children: [
          SizedBox(height: 25,),
          Expanded(
            child: FutureBuilder(
              future: friendsList,
              builder: (context, AsyncSnapshot<List<FriendsModelClass>> snapshot){

                if(snapshot.hasData){
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), bottomRight: Radius.circular(35))
                            ),
                            child: ExpansionTile(
                              collapsedTextColor: Colors.black,
                              textColor: Colors.blue,
                              iconColor: Colors.blue,
                              leading: Icon(Icons.person, color: Colors.blue,),
                              title: Text(snapshot.data![index].fname.toString(), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),),
                              subtitle: Text(snapshot.data![index].lname.toString(),),
                              trailing: const Icon(Icons.arrow_circle_down, size: 25,),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Age : \t\t\t ${snapshot.data![index].age.toString()}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Address : \t\t ${snapshot.data![index].address.toString()}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Gender : \t\t ${snapshot.data![index].gender.toString()}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 14),
                                      child: Text("Update Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    ),
                                    const SizedBox(width: 180,),
                                    GestureDetector(
                                        onTap: (){
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context){
                                                return AlertDialog(
                                                  actions: [
                                                    TextFormField(
                                                      controller: firstNameController,
                                                      onTap: (){
                                                        setState(() {
                                                          firstNameController.text = snapshot.data![index].fname.toString();
                                                        });
                                                      },
                                                      decoration: const InputDecoration(
                                                        hintText: "Enter First Name",
                                                        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                                                        labelText: "First Name",
                                                        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w800),
                                                        prefixIcon: Icon(Icons.person, color: Colors.black,),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: lastNameController,
                                                      onTap: (){
                                                        setState(() {
                                                          lastNameController.text = snapshot.data![index].lname.toString();
                                                        });
                                                      },
                                                      decoration: const InputDecoration(
                                                        hintText: "Enter Last Name",
                                                        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                                                        labelText: "Last Name",
                                                        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w800),
                                                        prefixIcon: Icon(Icons.person, color: Colors.black,),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: ageController,
                                                      onTap: (){
                                                        setState(() {
                                                          ageController.text = snapshot.data![index].age.toString();
                                                        });
                                                      },
                                                      decoration: const InputDecoration(
                                                        hintText: "Enter Your Age",
                                                        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                                                        labelText: "Age",
                                                        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w800),
                                                        prefixIcon: Icon(Icons.accessibility, color: Colors.black,),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      controller: addressController,
                                                      onTap: (){
                                                        setState(() {
                                                          addressController.text = snapshot.data![index].address.toString();
                                                        });
                                                      },
                                                      decoration: const InputDecoration(
                                                        hintText: "Enter Your Address",
                                                        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                                                        labelText: "Address",
                                                        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w800),
                                                        prefixIcon: Icon(Icons.location_on, color: Colors.black,),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.0,),
                                                    MaterialButton(
                                                      onPressed: (){
                                                        dbHelper?.update(
                                                            FriendsModelClass(
                                                              id: snapshot.data![index].id,
                                                              fname: firstNameController.text.toString(),
                                                              lname: lastNameController.text.toString(),
                                                              age: int.parse(ageController.text.toString()),
                                                              address: addressController.text.toString(),
                                                              gender: selectGender,
                                                            )
                                                        ).then((value) {
                                                          print("Data Updated");
                                                          Fluttertoast.showToast(msg: "Data Updated Successfully");
                                                        }).onError((error, stackTrace) {
                                                          print(error.toString());
                                                        });
                                                        setState(() {
                                                          friendsList = dbHelper.getCartListWithUserId();
                                                          Navigator.pop(context);
                                                        });
                                                      },
                                                      color: Colors.green,
                                                      child: Text("Update", style: TextStyle(color: Colors.white),),
                                                    ),
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                        child: const Icon(Icons.edit,  color: Colors.green, size: 25,))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 14),
                                      child: Text("Delete Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    ),
                                    const SizedBox(width: 180,),
                                    GestureDetector(
                                        onTap: (){
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context){
                                                return AlertDialog(
                                                  content: Text("Are you sure you want to delete, if yes then press delete"),
                                                  actions: [
                                                    SizedBox(height: 4.0,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        MaterialButton(
                                                          onPressed: (){
                                                            setState(() {
                                                              dbHelper?.delete(snapshot.data![index].id!);
                                                              // For Refreshing List
                                                              friendsList = dbHelper.getCartListWithUserId();
                                                              snapshot.data!.remove(snapshot.data![index]);
                                                              Navigator.pop(context);
                                                            });
                                                          },
                                                          color: Colors.blue,
                                                          child: Text("Delete", style: TextStyle(color: Colors.white),),
                                                        ),
                                                        MaterialButton(
                                                          color: Colors.green,
                                                          onPressed: (){
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text("No", style: TextStyle(color: Colors.white),),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                );
                                              }
                                          );
                                          // dbHelper.update(
                                          //   FriendsModel(
                                          //     id: snapshot.data[index].id,
                                          //       fName: "Wahid",
                                          //       lName: "Malik",
                                          //       age:  24,
                                          //       address: "Burewala",
                                          //       gender: "male",
                                          //   )
                                          // );
                                          // setState(() {
                                          //   friendsList = dbHelper.getCartListWithUserId();
                                          // });`
                                        },
                                        child: const Icon(Icons.delete,  color: Colors.red, size: 25,))
                                  ],
                                ),
                                const SizedBox(height: 20,),
                              ],
                            )
                        ),
                      );
                    },
                  );
                }else{
                  return Center(
                    child: Container(
                        child: const Text("No Data Found", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    //   body:Column(
    //     children: [
    //       Expanded(child: FutureBuilder(
    //           future: friendsList,
    //           builder: (context, AsyncSnapshot<List<FriendsModelClass>> snapshot)
    // {
    //   if(snapshot.hasData){
    //     return ListView.builder(
    //     physics: const BouncingScrollPhysics(),
    // itemCount: snapshot.data?.length,
    //     itemBuilder: (context, index)
    //     {
    //       return Padding(padding: EdgeInsets.symmetric(horizontal: 10),
    //     child: Card(
    //     shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(10))
    //     ),
    //     child: ListTile(
    //     leading: CircleAvatar(
    //     radius: 28,
    //     backgroundImage: AssetImage('assets/images/person2.png'),
    //
    //     ),
    //       title: Text(snapshot.data[index].fname.toString()),
    //     ),
    //     ),
    //     );
    //     }
    //     );
    // }
    // }
    //
    //       ))
    //     ],
    //   ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.withOpacity(0.8),
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  AddFriendsScreen()));
        },
        child: const Icon(Icons.add, size: 25,),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black54,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyApp()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,color: Colors.red,),
                        Text('Home',style: TextStyle(color: Colors.white),),
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendsListScreen()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add,color: Colors.red,),
                        Text('Friends',style: TextStyle(color: Colors.white),),
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodosApp()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_chart_rounded,color: Colors.red,),
                        Text('Tasks',style: TextStyle(color: Colors.white),),
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      setState(() {

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month,color: Colors.red,),
                        Text('Events',style: TextStyle(color: Colors.white),),
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      setState(() {

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_photo_alternate,color: Colors.red,),
                        Text('Images',style: TextStyle(color: Colors.white),),
                      ],
                    ),

                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}