import 'dart:convert';

import 'package:http/http.dart' as http;

import '../style/style.dart';
import '../utility/utility.dart';

var BaseURL="http://152.42.163.176:2006/api/v1";   // Task Manger --> BaseUrl
var RequestHeader={"Content-Type":"application/json"}; // Login --> Header --> content type

Future<bool> LoginRequest(FromValues) async{
  var URL=Uri.parse("${BaseURL}/login");
  var PostBody=json.encode(FromValues);
  var response= await http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    await WriteUserData(ResultBody);
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> RegistrationRequest(FromValues) async{
  var URL=Uri.parse("${BaseURL}/registration");
  var PostBody=json.encode(FromValues);
  var response= await http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> VerifyEmailRequest(Email) async{
  var URL=Uri.parse("${BaseURL}/RecoverVerifyEmail/${Email}");
  // there no need of encode
  var response= await http.get(URL,headers:RequestHeader);
  var ResultCode=response.statusCode;
  // but need to be decode
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    //await WriteEmailVerification(Email);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> VerifyOTPRequest(Email,OTP) async{
  var URL=Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");
  var response= await  http.get(URL,headers:RequestHeader);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    //await WriteOTPVerification(OTP);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> SetPasswordRequest(FromValues) async{

  var URL=Uri.parse("${BaseURL}/RecoverResetPass");
  var PostBody=json.encode(FromValues);

  var response= await  http.post(URL,headers:RequestHeader,body: PostBody);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);


  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

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
// Future<bool> TaskCreateRequest(FromValues) async {
//
//   var URL=Uri.parse("${BaseURL}/createTask");
//   String? token= await ReadUserData("token");
//   var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
//
//   var PostBody=json.encode(FromValues);
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