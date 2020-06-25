import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shooting_app/Model/base/ExceptionClasses.dart';
import 'package:shooting_app/Model/login/AuthServices.dart';

class RegisterController extends ChangeNotifier {
  AuthServices _authServices = AuthServices();
  int authState = 0;

  /// 0 for admin, 1 for student, 2 for coach, 3 for staff
  int userType = -1;
  bool confirmedPassword = true;
  bool isLoading = false;

  String name = "";
  String email = "";
  String password = "";
  String firstName = "";
  String middleName = "";
  String lastName = "";
  String rangeName = "";
  String userMob = "";
  String type = "";

  var realname; // made to divide name and store first, middle and last part, see splitName function

  void changeUserType(int value) {
    userType = value;
    namingUserType();
    notifyListeners();
  }

  void namingUserType() {
    switch (userType) {
      case 0:
        {
          type = "Admin";
        }
        break;

      case 1:
        {
          type = "Student";
        }
        break;

      case 2:
        {
          type = "Coach";
        }
        break;
      case 3:
        {
          type = "Staff";
        }
        break;
    }
  }

  void splitName() {
    realname = name.split(' ');
    firstName = realname[0];
    middleName = realname[1];
    lastName = realname[2];
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
      splitName();
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

  Future<String> register({
    @required String firstName,
    @required String middleName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String rangeName,
    @required String userMob,
  }) async {
    isLoading = true;
    String error = "";
    notifyListeners();
    try {
      await _authServices.register(
          firstName: firstName,
          middleName: middleName,
          lastName: lastName,
          userEmail: email,
          userPassword: password,
          userMobnum: userMob,
          userType: type);
      authState = 1;
    } catch (e) {
      isLoading = false;
      switch (e.runtimeType) {
        case InvalidCredentials:
          error = "Invalid Credentials";
          break;
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
