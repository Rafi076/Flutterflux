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

  String Status="Progress";

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


  StatusChange(id) async{
    showModalBottomSheet(context: context,
        builder: (context){
          return StatefulBuilder(
              builder: (BuildContext context,StateSetter setState){
                return Container(
                  padding: EdgeInsets.all(30),
                  height: 360,
                  child:Column(

                  ),
                );
              }
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
