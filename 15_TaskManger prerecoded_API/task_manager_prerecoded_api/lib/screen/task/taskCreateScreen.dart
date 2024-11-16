import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/style/style.dart';

import '../../api/apiClient.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({super.key});

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {

  Map<String, String> FormValues = {
    "title":"",
    "description": "",
    "status":"New"
  };
  bool Loading = false;

  InputOnChange(Mapkey, TextValue) {
    setState(() {
      FormValues.update(Mapkey, (value) => TextValue);
    });
  }


  FormOnSubmit() async {
    if (FormValues['title']!.length == 0) {
      ErrorToast('title Required');
    }
    else if (FormValues['description']!.length == 0) {
      ErrorToast('description Required');
    }
    else {
      setState(() {
        Loading = true;
      });

      // LoginRequest API Called!
      bool res = await TaskCreateRequest(FormValues);
      if (res == true) {
        // Navigate to dashboard page
        Navigator.pushNamedAndRemoveUntil(
            context, "/", (route) => false);
      }
      else {
        setState(() {
          Loading = false;
        });
        ErrorToast('Something went wrong! Try again.');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGreen,
        title: Text("Create New Task"),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center, // to make the content in center

            child: Loading
                ? (Center(child: CircularProgressIndicator(),))
                : (SingleChildScrollView(
              // Here -->  child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView( --> this is for showing loading while clicking login if login going to be true

              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add New Task", style: Head1Text(colorDarkBlue),),
                  const SizedBox(height: 1,),

                  TextFormField(
                    decoration: AppInputDecoration("Task Name "),
                    onChanged: (Textvalue) {
                      InputOnChange("title", Textvalue);
                    },
                  ),

                  const SizedBox(height: 20,),

                  TextFormField(
                    maxLines: 5,
                    decoration: AppInputDecoration("Info"),
                    onChanged: (Textvalue) {
                      InputOnChange("description", Textvalue);
                    },
                  ),

                  const SizedBox(height: 20,),

                  Container(child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild('Create')),),

                  SizedBox(height: 20,),

                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
