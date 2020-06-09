import 'dart:convert';
import 'package:shooting_app/Model/base/ExceptionClasses.dart';
import 'package:http/http.dart';
import 'package:shooting_app/Model/base/CustomNetworkCliet.dart';


class AuthServices{
  CustomNetworkClient _customNetworkClient =CustomNetworkClient();

  Future<Null> login(String email, String password) async{
    Map<String, String> body = {"userEmail" : email, "userPassword": password};
    Response response = await _customNetworkClient.POST('/users/login', jsonEncode(body));
    if(response.statusCode==200){
        Map<String, String> loginObject = jsonDecode(response.body);
        bool storeStatus = await _customNetworkClient.storeToken(loginObject['jwttoken']);
        if(!storeStatus){
          storeStatus = await _customNetworkClient.storeToken(loginObject['jwttoken']);
          if(!storeStatus){
            throw WriteException();
          }
        }
      } else {
        throw HttpException(response.statusCode);
      }
  }

}

