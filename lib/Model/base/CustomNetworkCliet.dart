import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shooting_app/Model/base/TokenPlayground.dart';
import 'package:shooting_app/Model/base/constants.dart';
import 'dart:io';

class CustomNetworkClient  {
  final String _urlString= URL;
  final TokenPlayground _tokenPlayground = TokenPlayground();

  Future<Null> _updateToken() async{
    if(!_tokenPlayground.updated){
      await _tokenPlayground.updateJWT();
    }
  }

  Future<Response> GET(@required String url) async{
    await _updateToken();
    await get("$_urlString$url", headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: _tokenPlayground.readJWT()
    });}


  Future<Response> POST(@required String url, @required String body) async{
    await _updateToken();
    await post("$_urlString$url",
      headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: _tokenPlayground.readJWT()
      },
      body: body
    );}

  bool isLoggedIn()=> _tokenPlayground.readJWT()!="";

  Future<bool> storeToken(String JWT) => _tokenPlayground.storeJWT(JWT);

  Future<bool> deleteToken() => _tokenPlayground.deleteJWT();

  /// Singleton Pattern
  CustomNetworkClient._internal();
  static final CustomNetworkClient _instance = CustomNetworkClient._internal();
  /// Returns CustomNetworkClient synchronously
  factory CustomNetworkClient() => _instance;

  /// Returns CustomNetworkClient asynchronously
  /// Ensures that JWT is updated
  static Future<CustomNetworkClient> getInstance() async{
    if(!_instance._tokenPlayground.updated){
      await _instance._tokenPlayground.updateJWT();
    }
    return _instance;
  }

}
