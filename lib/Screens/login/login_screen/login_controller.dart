import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shooting_app/Model/base/ExceptionClasses.dart';
import 'package:shooting_app/Model/login/AuthServices.dart';

class LoginNotifier extends ChangeNotifier{
  AuthServices _authServices =AuthServices();

  bool isLoading=false;
  int authState=0;

  Future<String> login({@required String email, @required String password}) async{
    isLoading=true;
    String error="";
    notifyListeners();
    try {
      await _authServices.login(email: email, password: password);
      authState = 1;
    } catch(e){
      isLoading=false;
      switch(e.runtimeType){
        case InvalidCredentials: error="Invalid Credentials";
        break;
        case HttpException: error="Problem with the Server";
        break;
        case SocketException: error="No Internet Connection";
        break;
      }
    } finally{
      isLoading = false;
      notifyListeners();
    }
    return error;
  }
}