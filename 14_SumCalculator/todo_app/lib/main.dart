import 'package:flutter/material.dart';

import 'Style.dart'; // Assuming your FieldDecoration function is in this file

void main() {
  runApp(const MyApp()); // Corrected: runApp() is needed to start the app.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sum app',
      home: HomeSum(),
    );
  }
}

class HomeSum extends StatefulWidget {
  const HomeSum({super.key});

  @override
  State<HomeSum> createState() => _HomeSumState();
}

class _HomeSumState extends State<HomeSum> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double sum = 0;
  bool isLoading = false; // To manage the loading state

  void calculateSum() async {
    setState(() {
      isLoading = true; // Start loading
    });

    await Future.delayed(const Duration(seconds: 1)); // Simulate some delay

    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      sum = num1 + num2;
      isLoading = false; // Stop loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator..'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Sum = $sum', style: HeadTextStyle(),),
            const SizedBox(height: 10),// Display the calculated sum
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: FieldDecoration("First Number"),
              style: HeadTextStyle(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: FieldDecoration("Second Number"),
              style: HeadTextStyle(),
            ),
            const SizedBox(height: 20), // Add some space before the button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                style: AppButton(),
                onPressed: isLoading ? null : calculateSum,
                // Disable button if loading
                child: isLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                  ),
                )
                    : const Text('ADD'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
