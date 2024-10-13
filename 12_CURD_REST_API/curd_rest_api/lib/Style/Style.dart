import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed = Colors.red;
const colorGreen = Colors.green;
const colorWhite = Colors.white;
const colorDarkBlue = Colors.blue;


void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );

}


void SucessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );

}






ScreenBackground(context) {
  return SvgPicture.asset(
    'assets/images/',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
    fillColor: colorWhite,
    filled: true,
    contentPadding: const EdgeInsets.all(8), // Increased padding for better UI
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite, width: 1),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide:
          BorderSide(color: colorGreen, width: 1), // Corrected focus border
    ),
    border: const OutlineInputBorder(),
    labelText: label,
  );
}



DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(
    decoration: BoxDecoration(
      color : colorWhite,
    border: Border.all(color: colorWhite,width: 1),
    borderRadius: BorderRadius.circular(4),
    ),
  child: Padding(
    padding: EdgeInsets.only(left: 30, right: 30),
      child: child,
  ),
  );
}


/// submit button
ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}



/// ink is a decorative container using for submit child
Ink SucessButtonChild(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
    ),
  );
}




















