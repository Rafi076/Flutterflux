import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/api/apiClient.dart';
import 'package:task_manager_prerecoded/component/TaskList.dart';

import '../style/style.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  List TaskItems = [];
  String Status="New";
  List StatusChange = [];
  bool Loading = true;

  @override
  void initState() {
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





  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {Loading=true;});
                await TaskDeleteRequest(id);
                await callDtata();
              }, child: Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? (Center(child: CircularProgressIndicator()))
        : RefreshIndicator(
            onRefresh: () async {
              await callDtata();
            },
        child: TaskList(TaskItems,DeleteItem,StatusChange)
          );
  }
}
