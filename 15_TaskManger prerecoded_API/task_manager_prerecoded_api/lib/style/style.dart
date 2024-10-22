import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

  const colorRed = Colors.red;
  const colorDark = Colors.black;
  const colorGreen = Colors.green;
  const colorBlue = Colors.blue;
  const colorOrange = Colors.orange;
  const colorWhite = Colors.white;
  const colorDarkBlue = Colors.blueAccent;
  const colorLightGray = Colors.grey;
  const colorLight = Colors.white70;




  TextStyle Head1Text(textColor){
    return TextStyle(
      color: textColor,
      fontSize: 28,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle Head6Text(textColor){
    return TextStyle(
      color: textColor,
      fontSize: 28,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
    );
  }

  InputDecoration AppInputDecoration(lable){
    return InputDecoration(
      focusedBorder:  const OutlineInputBorder(
        borderSide: const BorderSide(color: colorGreen, width: 1),
      ),
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: colorWhite, width: 0.0),
      ),
      border: OutlineInputBorder(),
      labelText : lable
    );
  }


  DecoratedBox AppDropDown(child){
    return DecoratedBox(decoration: BoxDecoration(color: colorWhite, border: Border.all(color: colorWhite, width: 1), borderRadius: BorderRadius.circular(4)),
    child: Padding(padding: EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
    );
  }

  SvgPicture ScreenBackGround(context){
    return SvgPicture.asset(
      'assets/images/back.svg',
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
        );
  }



  ButtonStyle AppButtonStyle (){
    return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
    );
  }

  TextStyle ButtonTextStyle(){
    return TextStyle(
      fontSize: 14,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
    );
  }


  Ink SuccessButtonChild(String ButtonTxt){
    return Ink(
      decoration: BoxDecoration(color: colorGreen, borderRadius: BorderRadius.circular(6),),
      child: Container(
        height: 45,
        alignment: Alignment.center,
        child: Text(ButtonTxt,style: ButtonTextStyle(),),
      ),
    );
  }

  void SuccessToast(msg){
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: colorGreen,
        textColor: colorWhite,
        fontSize: 16.0
    );
  }


  void ErrorToast(msg){
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: colorRed,
        textColor: colorWhite,
        fontSize: 16.0
    );
  }





































