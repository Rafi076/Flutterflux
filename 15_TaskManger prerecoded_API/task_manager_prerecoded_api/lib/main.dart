


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/screen/onboarding/emailVerificationScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/loginScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/pinVerificationScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/registrationScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager_prerecoded/screen/onboarding/splashScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",
      initialRoute: '/setPassword',
      routes: {
        '/':(context) => splashScreen(),
        '/login':(context) => loginScreen(),
        '/registration':(context) => registrationScreen(),
        '/emailVerification':(context) => emailVerificationScreen(),
        '/pinVerification':(context) => pinVerificationScreen(),
        '/setPassword':(context) => setPasswordScreen(),
      },
    );
  }
}
