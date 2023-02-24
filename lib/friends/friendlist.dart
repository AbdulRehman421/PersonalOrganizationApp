import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/friends/addfriend.dart';
import 'package:flutter_complete_guide/main.dart';
import 'friendDatabase.dart';
import 'friendmodelclass.dart';

class FriendDbList extends StatefulWidget {

  @override
  State<FriendDbList> createState() => _FriendDbListState();
}

class _FriendDbListState extends State<FriendDbList> {
  // final _titleController = TextEditingController();
  // final _amountController = TextEditingController();

  late Future<List<FriendModelClass>> friendList;
  late DBHelper dbHelper;
  String selectGender = 'male';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    friendList = dbHelper.getCartListWithUserId();
  }

  // Update Data



  @override
  Widget build(BuildContext context) {
    print("List $friendList");
    print("List ${dbHelper.getCartListWithUserId()}");
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple.withOpacity(0.8),
        title: const Text(
          "Friends List",
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
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: FutureBuilder(
              future: friendList,
              builder: (context,
                  AsyncSnapshot<List<FriendModelClass>> snapshot) {
                if (snapshot.hasData) {

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      print("Snapshot ${snapshot.data?.length}");
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            leading:
                            CircleAvatar(
                              radius: 30,
                              child: Padding(
                                padding: EdgeInsets.all(6),
                                child: FittedBox(
                                  child: Text("Age :  ${snapshot.data![index].age.toString()}",),
                                ),
                              ),
                            ),
                            title: Text(
                              "Name :  ${snapshot.data![index].name.toString()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17
                              ),
                            ),
                            subtitle: Text(
                              // DateFormat.yMMMd().format(snapshot.data[index].date.toString() as DateTime),

                              "Gender :  ${snapshot.data![index].gender.toString()}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400
                              ),
                            ),

                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).colorScheme.error,
                              onPressed: () {
                                setState(() {
                                  dbHelper?.delete(
                                      snapshot
                                          .data![
                                      index]
                                          .id!);
                                  // For Refreshing List
                                  friendList =
                                      dbHelper
                                          .getCartListWithUserId();
                                  snapshot.data
                                      ?.remove(snapshot
                                      .data![
                                  index]);

                                });
                              },
                            ),
                          ),


                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Container(
                      child: Text(
                        "No Data Found",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewFriend()));
      },
      child: Icon(Icons.add),
      ),
    );
  }
}