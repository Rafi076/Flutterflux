import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Join With Us", style: Head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("Learn With Rafi", style: Head6Text(colorLightGray),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Email Address "),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("First Name "),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Last Name "),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Mobile "),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Password "),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Confirm Password "),),
                const SizedBox(height: 20,),
                Container(child: ElevatedButton(
                    style: AppButtonStyle(),
                    onPressed: (){},
                    child: SuccessButtonChild('Registration')),)

              ],
            ),
          )
        ],
      ),
    );
  }
}
