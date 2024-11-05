
import 'package:flutter/cupertino.dart';

import '../api/apiClient.dart';
import '../style/style.dart';

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
    try {
      var data = await TaskListRequest("Completed");
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
      child: Text('completed task'),
    );
  }
}
