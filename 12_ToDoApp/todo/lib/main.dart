import 'package:flutter/material.dart';

import 'ToDoPage.dart';

MyApp main(){
  return(MyApp());
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
