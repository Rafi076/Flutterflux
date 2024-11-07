import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/apiClient.dart';
import '../style/style.dart';
import 'TaskList.dart';

class progresstaskList extends StatefulWidget {
  const progresstaskList({super.key});

  @override
  State<progresstaskList> createState() => _progresstaskListState();
}

class _progresstaskListState extends State<progresstaskList> {
  List TaskItems = [];
  bool Loading = true;

  @override
  void initState() {
    callDtata();
    super.initState();
  }

  callDtata() async {
    try {
      var data = await TaskListRequest("Progress");
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
    return Loading
        ? (Center(child: CircularProgressIndicator()))
        : RefreshIndicator(
            onRefresh: () async {
              await callDtata();
            },
          child: TaskList(TaskItems)
          );
  }
}
