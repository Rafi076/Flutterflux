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
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}


ButtonStyle AppButton (){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(20),
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
  );
}