

import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/style/style.dart';
import 'package:task_manager_prerecoded/utility/utility.dart';

AppBar TaskAppBar(){
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
                            child: Image.memory(ShowBase64Image("Base64String")),
                        ),
                    )
                ],
            ),
        ),
    );
}