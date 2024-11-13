import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/component/cancelTaskList.dart';
import 'package:task_manager_prerecoded/component/completedTaskList.dart';
import 'package:task_manager_prerecoded/component/newTaskList.dart';

import '../../component/TaskAppBar.dart';
import '../../component/appBottomNav.dart';
import '../../component/progressTaskList.dart';
import '../../utility/utility.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  int TabIndex=0;
  Map<String,String> ProfileData={"email":"c","firstName":"e","lastName":"r","photo":DefaultProfilePic};

  onItemTapped(int index){
    setState(() {
      TabIndex=index;
    });
  }


  final widgetOptions = [
    newTaskList(),
    progresstaskList(),
    completedTaskList(),
    cancelTasklist(),
  ];
  ReadAppBarData() async {
    String? email= await ReadUserData('email');
    String? firstName= await ReadUserData('firstName');
    String? lastName= await ReadUserData('lastName');
    String? photo= await ReadUserData('photo');
    setState(() {
      ProfileData={"email":'$email',"firstName":'$firstName',"lastName":'$lastName',"photo":'$photo'};
    });
  }

  @override
  void initState() {
    ReadAppBarData();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(context,ProfileData),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex,onItemTapped),
    );
  }
}