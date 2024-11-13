
import 'dart:convert';   // For base64 decoding
import 'dart:typed_data'; // For Uint8List

import 'package:shared_preferences/shared_preferences.dart';

String DefaultProfilePic = "data:image/jpeg;base64,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";

// Write user data to shared preferences
Future<void> writeUserData(userData) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    // Accessing the first element inside 'data' list
    var userInfo = userData['data'];

    await prefs.setString('_id', userInfo['_id']);
    await prefs.setString('email', userInfo['email']);
    await prefs.setString('firstName', userInfo['firstName']);
    await prefs.setString('lastName', userInfo['lastName']);
    await prefs.setString('mobile', userInfo['mobile']);
    await prefs.setString('photo', userInfo['photo']);

    // Avoid storing passwords in plain text!
    // Consider using encrypted storage if absolutely necessary
    await prefs.setString('token', userData['token']);
    await prefs.setString('createdDate', userInfo['createdDate']);
  } catch (e) {
    print('Error writing user data: $e');
  }
}

// Emailverification
Future<void> WriteEmailVerification(Email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification', Email);
}
//otp
Future<void> WriteOTPVerification(OTP) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification', OTP);
}


// Read sharePreference -->> it will work for each data like email,name,mobile
Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata= await prefs.getString(Key);
  return mydata;
}


// token remove for logout
Future <bool> RemoveToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  return true;
}






ShowBase64Image(Base64String){
  UriData? data= Uri.parse(Base64String).data;
  Uint8List MyImage =   data!.contentAsBytes();
  return MyImage;
}