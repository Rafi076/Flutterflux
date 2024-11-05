import 'package:flutter/cupertino.dart';

import '../api/apiClient.dart';
import '../style/style.dart';

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



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('cancel task'),
    );
  }
}
