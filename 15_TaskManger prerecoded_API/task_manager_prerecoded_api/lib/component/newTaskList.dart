

import 'package:flutter/cupertino.dart';
import 'package:task_manager_prerecoded/api/apiClient.dart';

import '../style/style.dart';

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
    try {
      var data = await TaskListRequest("New");
      setState(() {
        Loading = false;
        TaskItems = data;
      });
    } catch (e) {
      setState(() {
        Loading = false;
      });
      ErrorToast("Failed to load tasks: $e");
    }
  }






  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('new task'),
    );
  }
}
