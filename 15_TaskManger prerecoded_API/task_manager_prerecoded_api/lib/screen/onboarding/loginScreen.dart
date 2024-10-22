import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
                Text("Get Start With", style: Head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("Learn With Rafi", style: Head6Text(colorLightGray),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Email Address "),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Password "),),
                const SizedBox(height: 20,),
                Container(child: ElevatedButton(
                  style: AppButtonStyle(),
                    onPressed: (){},
                    child: SuccessButtonChild('Login')),)
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
