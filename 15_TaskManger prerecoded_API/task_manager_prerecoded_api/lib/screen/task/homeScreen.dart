import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/appBottomNav.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(),
      bottomNavigationBar:  appBottomNav(1),
    );
  }
}
