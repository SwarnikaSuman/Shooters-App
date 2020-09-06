import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:shooting_app/Model/base/AuthFunctions.dart';
import 'package:shooting_app/Model/base/CustomNetworkCliet.dart';
import 'package:shooting_app/Model/base/ExceptionClasses.dart';
import 'package:shooting_app/Model/database/moor_database.dart';

class AuthServices{
  final CustomNetworkClient _customNetworkClient = CustomNetworkClient();
  final AuthFunction _authFunction = AuthFunction();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email']
  );

  /// Throws WriteException if unable to save the JWT
  /// Throws HttpException if respone code is other than 200
  Future<Null> login({@required String email, @required String password}) async{
    Map<String, dynamic> body = {'userEmail' : email, 'userPassword' : password};
    Response response = await _customNetworkClient.POST(url: '/users/login', body: jsonEncode(body));
    if(response.statusCode==200){
        Map<String, dynamic> loginObject = jsonDecode(response.body);
        if(loginObject.containsKey('jwttoken')){
          bool storeStatus =
            await _authFunction.storeToken(loginObject['jwttoken']);
        if (!storeStatus) {
          storeStatus = await _authFunction.storeToken(loginObject['jwttoken']);
          if (!storeStatus) {
            throw WriteException();
          }
        }
        final AppDatabase _appDatabase = AppDatabase();
        await _appDatabase.userLogDao.clearUserLog();
        await _appDatabase.userLogDao.insertUserLog(UserLogTable(
            Name: loginObject['Name'],
            email: loginObject['email'],
            userType: loginObject['userType']));
      }else{
          throw InvalidCredentials();
        }
      } else {
        throw HttpException(response.statusCode);
      }
  }


  /// Returns true if user registers successfully
  /// Returns false if user email is already registered
  /// Throws HttpException if response code is other than 200
  Future<void> register(
      {@required String userName,
      @required String userEmail,
      @required String userPassword,
      @required String userMobnum,
      @required int userType}) async {
    Map<String, dynamic> body = {
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'userMobnum': userMobnum,
      'userType': userType
    };
    Response response = await _customNetworkClient.POST(
        url: '/users/register', body: jsonEncode(body));
    if (response.statusCode == 200) {
      Map<String, String> registerObject = jsonDecode(response.body);
      if (registerObject['message'] != "success") {
        throw NotSuccessException(registerObject['message']);
      }
    } else {
      throw HttpException(response.statusCode);
    }
  }


  Future<Null> signInWithGoogle() async{
    await _googleSignIn.signOut();
    GoogleSignInAccount account = await _googleSignIn.signIn();
    //TODO: Implement Google Sign In with Backend
  }


  Future<Null> linkGoogleAccount() async{
  await _googleSignIn.signOut();
  GoogleSignInAccount account = await _googleSignIn.signIn();
  //TODO: Implement Google Account registration with Backend

  }

}



