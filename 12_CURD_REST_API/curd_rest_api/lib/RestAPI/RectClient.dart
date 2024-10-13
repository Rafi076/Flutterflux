import 'dart:convert';
import 'package:curd_rest_api/Style/Style.dart';
import 'package:http/http.dart' as http;



Future <List>ProductGridViewListRequest() async {
  var URL = Uri.parse("http://152.42.163.176:2008/api/v1/UpdateProduct/65abe919f68794d36c5b7ffat");
  var PostHeader = {"Content-Type":"application/json"};
  var response = await http.get(URL,headers: PostHeader,);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){
    SucessToast("Result Success");
    return ResultBody['data'];
  }
  else {
    ErrorToast("Request Fail! Try Again");
    return [];
  }
}





Future<bool>ProductCreateRequest(FromValues) async {
  var URL = Uri.parse("http://152.42.163.176:2008/api/v1/CreateProduct");
  var PostBody = json.encode(FromValues);
  var PostHeader = {"Content-Type":"application/json"};

  var response = await http.post(URL,headers: PostHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){
    SucessToast("Result Success");
    return true;
  }
  else {
    ErrorToast("Request Fail! Try Again");
    return false;
  }
}