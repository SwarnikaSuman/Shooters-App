import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shooting_app/Model/base/ExceptionClasses.dart';
import 'package:shooting_app/Model/login/AuthServices.dart';

class RegisterController extends ChangeNotifier {
  AuthServices _authServices = AuthServices();

  /// 0 for admin, 1 for student, 2 for coach, 3 for staff
  int userType = -1;
  bool confirmedPassword = true;
  bool isLoading = false;

  String name = "";
  String email = "";
  String password = "";
  String rangeName = "";
  String userMob = "";


  void changeUserType(int value) {
    userType = value;
    notifyListeners();
  }


  void confirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      confirmedPassword = false;
    } else {
      confirmedPassword = true;
    }
    notifyListeners();
  }

  bool signUp(String name, String email, String password) {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      this.name = name;
      this.email = email;
      this.password = password;
      return true;
    }
    return false;
  }

  bool secondSignUp(String rangeName, String userMob) {
    if (rangeName.isNotEmpty && userMob.isNotEmpty) {
      this.rangeName = rangeName;
      this.userMob = userMob;
      return true;
    }
    return false;
  }

  Future<String> register() async {
    isLoading = true;
    String error = "";
    notifyListeners();
    try {
      await _authServices.register(
          userName: name,
          userEmail: email,
          userPassword: password,
          userMobnum: userMob,
          userType: userType);
      await _authServices.login(email: email, password: password);
    } catch (e) {
      isLoading = false;
      switch (e.runtimeType) {
        case HttpException:
          error = "Problem with the Server";
          break;
        case SocketException:
          error = "No Internet Connection";
          break;
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return error;
  }
}
