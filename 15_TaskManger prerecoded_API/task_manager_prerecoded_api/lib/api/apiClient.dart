import 'dart:convert';
import 'package:http/http.dart' as http;

import '../style/style.dart';
import '../utility/utility.dart';

var BaseURL="http://35.73.30.144:2005/api/v1";   // Task Manger --> BaseUrl
var RequestHeader={"Content-Type":"application/json"}; // Login --> Header --> content type




Future<bool> LoginRequest(FormValues) async{

  try {
    var url = Uri.parse("${BaseURL}/login");
    var postBody = json.encode(FormValues);

    var response = await http.post(
      url,
      headers: RequestHeader,
      body: postBody,
    );

    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);

    if (resultCode == 200 && resultBody['status'] == "success") {
      SuccessToast("Request Success");

      await writeUserData(resultBody);

      return true;
    } else {
      ErrorToast(resultBody['message'] ?? "Registration failed! Try again.");
      ErrorToast("Server error: ${response.statusCode}");
      return false;
    }
  } catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}





Future<bool> RegistrationRequest(FormValues) async{
  try{
    var URL=Uri.parse("${BaseURL}/registration");
    var PostBody=json.encode(FormValues);

    var response= await  http.post(URL,headers:RequestHeader,body: PostBody);

    var resultCode=response.statusCode;
    var resultBody=json.decode(response.body);

    if(resultCode==200 && resultBody['status']=="success"){
      SuccessToast("Request Success");
      return true;
    }
    else{
      ErrorToast(resultBody['message'] ?? "Registration failed! Try again.");
      ErrorToast("Server error: ${response.statusCode}");
      return false;
    }
  }catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}






Future<bool> VerifyEmailRequest(Email) async{
  try{
    var URL=Uri.parse("${BaseURL}/RecoverVerifyEmail/${Email}");
    var response= await http.get(URL,headers:RequestHeader);

    var resultCode=response.statusCode;
    var resultBody=json.decode(response.body);

    if(resultCode==200 && resultBody['status']=="success"){

      await WriteEmailVerification(Email);

      SuccessToast("Request Success");
      return true;
    }
    else{
      ErrorToast(resultBody['message'] ?? "Verifying request failed! Try again.");
      ErrorToast("Server error: ${response.statusCode}");
      return false;
    }
  }catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}






Future<bool> VerifyOTPRequest(Email,OTP) async{
  try{
    var URL=Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");
    var response= await  http.get(URL,headers:RequestHeader);

    var resultCode=response.statusCode;
    var resultBody=json.decode(response.body);

    if(resultCode==200 && resultBody['status']=="success"){

      await WriteOTPVerification(OTP);

      SuccessToast("Request Success");
      return true;
    }
    else{
      ErrorToast(resultBody['message'] ?? "Verifying OTP failed! Try again.");
      ErrorToast("Server error: ${response.statusCode}");
      return false;
    }
  }catch (e) {
    ErrorToast("An error occurred: $e");
    return false;
  }
}





Future<bool> SetPasswordRequest(FormValues) async {
  try {
    var URL = Uri.parse("${BaseURL}}/RecoverResetPassword");
    var PostBody = json.encode(FormValues);
    var response = await http.post(URL, headers: RequestHeader, body: PostBody);

    if (response.statusCode == 200) {
      var resultBody = json.decode(response.body);
      if (resultBody['status'] == "success") {
        SuccessToast("Password Reset Successful");
        return true;
      } else {
        throw Exception(resultBody['message'] ?? "Unexpected error");
      }
    } else {
      throw Exception("Server Error: ${response.statusCode}");
    }
  } catch (e) {
    ErrorToast("Error: $e");
    return false;
  }
}





//
// Future<List> TaskListRequest(Status) async {
//   var URL=Uri.parse("${BaseURL}/listTaskByStatus/${Status}");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
//   var response= await http.get(URL,headers:RequestHeaderWithToken);
//   var ResultCode=response.statusCode;
//   var ResultBody=json.decode(response.body);
//   if(ResultCode==200 && ResultBody['status']=="success"){
//     SuccessToast("Request Success");
//     return ResultBody['data'];
//   }
//   else{
//     ErrorToast("Request fail ! try again");
//     return [];
//   }
// }
//
// Future<bool> TaskCreateRequest(FormValues) async {
//
//   var URL=Uri.parse("${BaseURL}/createTask");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
//
//   var PostBody=json.encode(FormValues);
//
//   var response= await http.post(URL,headers:RequestHeaderWithToken,body: PostBody);
//   var ResultCode=response.statusCode;
//   var ResultBody=json.decode(response.body);
//   if(ResultCode==200 && ResultBody['status']=="success"){
//     SuccessToast("Request Success");
//     return true;
//   }
//   else{
//     ErrorToast("Request fail ! try again");
//     return false;
//   }
// }
//
//
// Future<bool> TaskDeleteRequest(id) async {
//   var URL=Uri.parse("${BaseURL}/deleteTask/${id}");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
//   var response= await http.get(URL,headers:RequestHeaderWithToken);
//   var ResultCode=response.statusCode;
//   var ResultBody=json.decode(response.body);
//   if(ResultCode==200 && ResultBody['status']=="success"){
//     SuccessToast("Request Success");
//     return true;
//   }
//   else{
//     ErrorToast("Request fail ! try again");
//     return false;
//   }
// }
//
//
// Future<bool> TaskUpdateRequest(id,status) async {
//   var URL=Uri.parse("${BaseURL}/updateTaskStatus/${id}/${status}");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
//   var response= await http.get(URL,headers:RequestHeaderWithToken);
//   var ResultCode=response.statusCode;
//   var ResultBody=json.decode(response.body);
//   if(ResultCode==200 && ResultBody['status']=="success"){
//     SuccessToast("Request Success");
//     return true;
//   }
//   else{
//     ErrorToast("Request fail ! try again");
//     return false;
//   }
// }