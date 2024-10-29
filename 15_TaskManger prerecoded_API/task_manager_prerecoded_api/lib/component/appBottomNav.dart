

import 'package:flutter/material.dart';
import 'package:task_manager_prerecoded/style/style.dart';

BottomNavigationBar appBottomNav(currentIndex){
  return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "New",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Progress",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Completed",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Cancel",
        ),

      ],

      selectedItemColor: colorGreen,

      unselectedItemColor: colorLightGray,

      currentIndex: currentIndex,

        // to see the selected & unselected label context
          showSelectedLabels: true,
          showUnselectedLabels: true,
  );
}