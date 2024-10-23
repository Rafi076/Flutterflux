import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/style/style.dart';

import '../../api/apiClient.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {


  Map<String, String> FromValues = {
    // there is only 2 value (email, password) in my POST Login API
    "email": "",
    "password": "",
  };
  bool Loading = false;

  // to using 2 input field we used 2 time call a {OnPressed} function which can be Expensive. instead of this we will use InputOnChange()
  InputOnChange(Mapkey, TextValue) {
    setState(() {
      FromValues.update(Mapkey, (value) => TextValue);
    });
  }





  FormOnSubmit() async {
    if(FromValues['email']!.length == 0){
      ErrorToast('email Required');
    }
    else if(FromValues['password']!.length == 0){
      ErrorToast('password Required');
    }
    else{
      setState(() {
        Loading = true;
      });

      // LoginRequest API Called!
      bool res=await LoginRequest(FromValues);
      if(res==true){
        // Navigate to dashboard page
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      }
      else{
        setState(() {
          Loading=false;
        });
      }

    }
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,  // to make the content in center

            child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
              // Here -->  child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView( --> this is for showing loading while clicking login if login going to be true

              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get Start With", style: Head1Text(colorDarkBlue),),
                  const SizedBox(height: 1,),
                  Text("Learn With Rafi", style: Head6Text(colorLightGray),),
                  const SizedBox(height: 20,),

                  TextFormField(
                    decoration: AppInputDecoration("Email Address "),
                    onChanged: (Textvalue) {
                      InputOnChange("email", Textvalue);
                    },
                  ),

                  const SizedBox(height: 20,),

                  TextFormField(
                    decoration: AppInputDecoration("Password "),
                    onChanged: (Textvalue) {
                      InputOnChange("password", Textvalue);
                    },
                  ),

                  const SizedBox(height: 20,),

                  Container(child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: (){
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild('Login')),)

                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
