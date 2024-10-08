import 'package:flutter/material.dart';
import 'ToDoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo app',
      theme: ThemeData(primaryColor: Colors.green),
      home: const ToDoPage(),
    );
  }
}
