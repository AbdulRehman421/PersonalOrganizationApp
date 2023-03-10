import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Events/mainEvent.dart';
import 'package:flutter_complete_guide/friend/friendlist.dart';
import 'Task/mainTask.dart';
import 'image/mainimage.dart';




class MyPersonalApp extends StatefulWidget {
  @override
  State<MyPersonalApp> createState() => _MyPersonalAppState();
}

class _MyPersonalAppState extends State<MyPersonalApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Organizer System',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            toolbarTextStyle: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ).bodyMedium, titleTextStyle: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).titleLarge,
          ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.red)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Personal Organizer System',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => MyTaskApp()));
            },
            child: Icon(Icons.ac_unit,color: Colors.blue,))],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Container(
              height: 250,
              width: 90,
              child: Image.asset(
                'assets/images/download.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FriendDbList()));
                          },
                          child: Column(
                            children: [
                              Icon(Icons.person_add_alt,color: Colors.white,size: 45,),
                              Text('Add Friends', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),)
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.blue,
                                  Colors.red,
                                ]
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyTaskApp()));
                          },
                          child: Column(
                            children: [
                              Icon(Icons.add_chart,color: Colors.white,size: 45,),
                              Text('Add Tasks', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),)
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.blue,
                                  Colors.red,
                                ]
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyEventApp()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Icon(Icons.calendar_month_outlined,color: Colors.white,size: 45,),
                                Text('Add Events', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),)
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Colors.blue,
                                      Colors.red,
                                    ]
                                ),
                                borderRadius: BorderRadius.circular(30)
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => k()));
                            },
                            child: Column(
                              children: [
                                Icon(Icons.add_photo_alternate_outlined,color: Colors.white,size: 45,),
                                Text('Add Images', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),)
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blue,
                                    Colors.red,
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
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
                              builder: (context) => MyPersonalApp()));
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
                              builder: (context) => FriendDbList()));
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
                              builder: (context) => MyTaskApp()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyEventApp()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => k()));
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
