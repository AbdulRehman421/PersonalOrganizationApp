import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main.dart';

import '../tabs/addtaskscreen.dart';
import '../tabs/all_tasks.dart';
import '../tabs/completed_task.dart';
import '../tabs/incomplete_task.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tasks List'),
        leading: IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyApp(),
            ),
          );
        }, icon: Icon(Icons.arrow_back)),

        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Incomplete'),
            Tab(text: 'Complete'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          AllTasksTab(),
          IncompleteTasksTab(),
          CompletedTasksTab(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTaskScreen()));
      },
      child: Icon(Icons.add),
      ),
    );
  }
}