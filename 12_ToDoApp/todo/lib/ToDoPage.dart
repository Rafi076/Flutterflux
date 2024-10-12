import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<String> ToDoList = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        ToDoList.add(_taskController.text);
        _taskController.clear(); // Clear the text field after adding
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "ToDo App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _taskController,
                    decoration: const InputDecoration(hintText: 'Enter task'),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: ElevatedButton(
                    onPressed: _addTask, // Call the function to add a task
                    child: const Text('ADD'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 90,
              child: ListView.builder(
                itemCount: ToDoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(ToDoList[index]),
                      // Display the task
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
