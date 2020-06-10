import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shooting_app/Model/base/ExceptionClasses.dart';
import 'package:http/http.dart';
import 'package:shooting_app/Model/base/CustomNetworkCliet.dart';


class AuthServices{
  final CustomNetworkClient _customNetworkClient = CustomNetworkClient();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email']
  );
  /// Throws WriteException if unable to save the JWT
  /// Throws HttpException if respone code is other than 200
  Future<Null> login(@required String email, @required String password) async{
    Map<String, String> body = {'userEmail' : email, 'userPassword' : password};
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

  /// Returns true if user registers successfully
  /// Returns false if user email is already registered
  /// Throws HttpException if response code is other than 200
  Future<bool> register(
      @required String firstName,
      @required String middleName,
      @required String lastName,
      @required String userEmail,
      @required String userPassword,
      @required String userMobnum,
      @required String userType) async{

    Map<String, String> body = {
      'firstName' : firstName,
      'middleName' : middleName,
      'lastName': lastName,
      'userEmail' : userEmail,
      'userPassword' : userPassword,
      'userMobnum' : userMobnum,
      'userType' : userType
    };
    Response response = await _customNetworkClient.POST('/users/register', jsonEncode(body));
    if(response.statusCode==200){
      Map<String, String> registerObject = jsonDecode(response.body);
        if(registerObject['message']=="success"){
          return true;
        };
      return false;
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



