import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue, // Set app bar color to blue
        centerTitle: true, // Center the title
        title: const Text(
          "AppBar..",
          style: TextStyle(
            color: Colors.black, // Set text color to black
            fontWeight: FontWeight.bold, // Set text to bold
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black), // Drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer when pressed
            },
          ),
        ),
      ),
      drawer: Drawer(
        // Add your drawer content here
      ),


        body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(child: TextFormField()),
                  Expanded(child:
                  ElevatedButton(onPressed: (){},
                    child: Text('ADD'),
                  ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 90,
                child: Text('List View')),
          ],
        ),
      )
    );
  }
}
