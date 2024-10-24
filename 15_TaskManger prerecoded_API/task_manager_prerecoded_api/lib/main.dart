


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/screen/onboarding/emailVerificationScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/loginScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/pinVerificationScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/registrationScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/splashScreen.dart';
import 'package:task_manager_prerecoded/screen/task/newTaskListScreen.dart';
import 'package:task_manager_prerecoded/utility/utility.dart';

main() async {

  // The /login route directs users to log in if no valid token is found,
  // while the /newTaskList route opens the task management screen for authenticated users.

  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');

  if(token==null){
    runApp(MyApp("/login"));
  }
  else{
    runApp(MyApp("/newTaskList"));
  }
}

class MyApp extends StatelessWidget {
  final String FirstRoute;
   MyApp(this.FirstRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: FirstRoute,
      routes: {
        '/':(context) => splashScreen(),
        '/login':(context) => loginScreen(),
        '/registration':(context) => registrationScreen(),
        '/emailVerification':(context) => emailVerificationScreen(),
        '/pinVerification':(context) => pinVerificationScreen(),
        '/setPassword':(context) => setPasswordScreen(),
        '/newTaskList':(context) => newTaskListScreen(),
      },
    );
  }
}
