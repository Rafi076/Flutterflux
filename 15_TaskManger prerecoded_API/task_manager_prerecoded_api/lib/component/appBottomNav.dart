

import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/style/style.dart';

BottomNavigationBar appBottomNav(currentIndex,onItemTapped){
  return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "New",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time_rounded),
          label: "Progress",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_rounded),
          label: "Completed",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cancel_rounded),
          label: "Cancel",
        ),

      ],

      selectedItemColor: colorGreen,

      unselectedItemColor: colorLightGray,

      currentIndex: currentIndex,

        // to see the selected & unselected label context
          showSelectedLabels: true,
          showUnselectedLabels: true,


          onTap: onItemTapped,
          //to not move after tapping on nav icon
          type: BottomNavigationBarType.fixed,
  );
}