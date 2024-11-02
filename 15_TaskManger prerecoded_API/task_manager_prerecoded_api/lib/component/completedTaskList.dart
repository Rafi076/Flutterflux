
import 'package:flutter/cupertino.dart';

import '../api/apiClient.dart';

class completedTaskList extends StatefulWidget {
  const completedTaskList({super.key});

  @override
  State<completedTaskList> createState() => _completedTaskListState();
}

class _completedTaskListState extends State<completedTaskList> {


  List TaskItems = [];
  bool Loading = true;

  @override
  void initState(){
    callDtata();
    super.initState();
  }



  callDtata() async {
    var data = await TaskListRequest("completed");
    setState(() {
      Loading = false;
      TaskItems = data;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('completed task'),
    );
  }
}
