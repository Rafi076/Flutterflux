import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/apiClient.dart';
import '../style/style.dart';
import 'TaskList.dart';

class cancelTasklist extends StatefulWidget {
  const cancelTasklist({super.key});

  @override
  State<cancelTasklist> createState() => _cancelTasklistState();
}

class _cancelTasklistState extends State<cancelTasklist> {
  List TaskItems = [];
  String Status="Canceled";



  bool Loading = true;

  @override
  void initState() {
    callDtata();
    super.initState();
  }

  callDtata() async {
    try {
      var data = await TaskListRequest("cancel");
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      RadioListTile(title: Text("New"), value: "New", groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Progress"), value: "Progress", groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Completed"), value: "Completed", groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Canceled"), value: "Canceled", groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value.toString();
                          });
                        },
                      ),

                      Container(child: ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('Confirm'),
                        onPressed: (){
                          Navigator.pop(context);
                          //UpdateStatus(id);
                        },
                      ),)
                    ],
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
