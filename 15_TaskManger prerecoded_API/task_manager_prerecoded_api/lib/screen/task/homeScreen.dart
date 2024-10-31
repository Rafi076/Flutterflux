import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/component/cancelTaskList.dart';
import 'package:task_manager_prerecoded/component/completedTaskList.dart';
import 'package:task_manager_prerecoded/component/newTaskList.dart';

import '../../component/appBottomNav.dart';
import '../../component/progressTaskList.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  int TabIndex = 0;

  onItemTapped(int index){
    setState(() {
      TabIndex = index;
    });
  }



  final widgetOptions = [
    newTaskList(),
    progresstaskList(),
    completedTaskList(),
    cancelTasklist(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen.."),
      ),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar:  appBottomNav(TabIndex, onItemTapped),
    );
  }
}
