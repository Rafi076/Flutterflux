import 'package:flutter/cupertino.dart';

import '../api/apiClient.dart';

class cancelTasklist extends StatefulWidget {
  const cancelTasklist({super.key});

  @override
  State<cancelTasklist> createState() => _cancelTasklistState();
}

class _cancelTasklistState extends State<cancelTasklist> {


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
      child: Text('cancel task'),
    );
  }
}
