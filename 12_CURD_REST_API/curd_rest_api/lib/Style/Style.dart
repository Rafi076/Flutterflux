import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const colorRed = Colors.red;
const colorGreen = Colors.green;
const colorWhite = Colors.white;
const colorDarkBlue = Colors.blue;

ScreenBackground(context) {
  return SvgPicture.asset(
    'assets/images/back-svg.jpg',
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
