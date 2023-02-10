import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/ToDoTask/provider/todos_model.dart';
import 'package:provider/provider.dart';


import 'screens/homescreen.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodosModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
  // https://dev.to/shakib609/create-a-todos-app-with-flutter-and-provider-jdh
}

