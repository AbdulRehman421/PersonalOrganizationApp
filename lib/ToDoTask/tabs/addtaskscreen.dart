import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../models/task.dart';
import '../provider/todos_model.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskTitleController = TextEditingController();
  final detailTitleController = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    taskTitleController.dispose();
    detailTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = taskTitleController.text;
    final String detailVal = detailTitleController.text;
    final bool completed = completedStatus;
    if (textVal.isNotEmpty) {
      final Task todo = Task(
        title: textVal,
        completed: completed,
      );
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                      controller: taskTitleController,
                    decoration: InputDecoration(
                        label: Text('Task Name'),
                        hintText: 'Enter you Task Name',
                    ),
                  ),
                  TextField(
                    controller: detailTitleController,
                    decoration: InputDecoration(
                      label: Text('Task Details'),
                      hintText: 'Enter you Task Details',
                    ),
                  ),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                      completedStatus = checked!;
                    }),
                    title: Text('Complete?'),
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}