

import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/style/style.dart';
import 'package:task_manager_prerecoded/utility/utility.dart';

AppBar TaskAppBar(context,ProfileData){
    return AppBar(
        backgroundColor: colorGreen,
        flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Row(
                children: [
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 24,
                        child: ClipOval(
                            child: Image.memory(ShowBase64Image(ProfileData['photo']))),
                    )
                ,SizedBox(width: 10,),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text('${ProfileData['firstName']}  ${ProfileData['lastName']}', style: Head7Text(colorWhite),),
                            Text(ProfileData['email'], style: Head9Text(colorWhite),)
                        ],
                    )
                ],
            ),
        ),
        
        actions: [
            IconButton(onPressed: (){},
                icon: Icon(Icons.add, color: Colors.white70,),),

            IconButton(
                onPressed: ()  async {
                   await RemoveToken();
                   Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
            },
                icon: Icon(Icons.logout, color: Colors.white70,),)
        ],
        
    );
}