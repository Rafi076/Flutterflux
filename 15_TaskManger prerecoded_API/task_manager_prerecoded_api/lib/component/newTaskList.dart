

import 'package:flutter/cupertino.dart';
import 'package:task_manager_prerecoded/api/apiClient.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {

  List TaskItems = [];
  bool Loading = true;

  @override
  void initState(){
    callDtata();
    super.initState();
  }

  callDtata() async {
    var data = await TaskListRequest("New");
    setState(() {
      Loading = false;
      TaskItems = data;
    });
  }






  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('new task'),
    );
  }
}
