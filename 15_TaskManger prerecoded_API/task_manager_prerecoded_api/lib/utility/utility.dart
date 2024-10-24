

import 'package:shared_preferences/shared_preferences.dart';

// Write user data to shared preferences
Future<void> writeUserData(userData) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    // Accessing the first element inside 'data' list
    var userInfo = userData['data'][0];

    await prefs.setString('_id', userInfo['_id']);
    await prefs.setString('email', userInfo['email']);
    await prefs.setString('firstName', userInfo['firstName']);
    await prefs.setString('lastName', userInfo['lastName']);
    await prefs.setString('mobile', userInfo['mobile']);

    // Avoid storing passwords in plain text!
    // Consider using encrypted storage if absolutely necessary
    await prefs.setString('token', userData['token']);
    await prefs.setString('createdDate', userInfo['createdDate']);
  } catch (e) {
    print('Error writing user data: $e');
  }
}


// Read sharePreference
Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata= await prefs.getString(Key);
  return mydata;
}