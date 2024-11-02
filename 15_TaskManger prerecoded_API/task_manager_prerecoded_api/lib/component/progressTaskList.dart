import 'package:flutter/cupertino.dart';

import '../api/apiClient.dart';

class progresstaskList extends StatefulWidget {
  const progresstaskList({super.key});

  @override
  State<progresstaskList> createState() => _progresstaskListState();
}

class _progresstaskListState extends State<progresstaskList> {


  List TaskItems = [];
  bool Loading = true;

  @override
  void initState(){
    callDtata();
    super.initState();
  }



  callDtata() async {
    var data = await TaskListRequest("Progress");
    setState(() {
      Loading = false;
      TaskItems = data;
    });
  }







  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Progress task'),
    );
  }
}
