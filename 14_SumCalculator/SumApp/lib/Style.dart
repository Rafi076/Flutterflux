import 'package:flutter/material.dart';

InputDecoration FieldDecoration(String label) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(20),
    fillColor: Colors.blue,
    border: const OutlineInputBorder(),
    labelText: label, // Use labelText for a string label
  );
}

TextStyle HeadTextStyle(){
  return const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}


ButtonStyle AppButton (){
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(20),
    backgroundColor: Colors.blue,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
  );
}