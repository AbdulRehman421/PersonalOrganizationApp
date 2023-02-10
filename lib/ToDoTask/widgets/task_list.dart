import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/ToDoTask/widgets/task_list_items.dart';

import '../models/task.dart';


class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({
    required this.tasks
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    return tasks.map((todo) => TaskListItem(task: todo)).toList();
  }
}