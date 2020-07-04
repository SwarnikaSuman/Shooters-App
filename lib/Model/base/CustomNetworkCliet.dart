import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shooting_app/Model/base/TokenPlayground.dart';
import 'package:shooting_app/Model/base/constants.dart';

class CustomNetworkClient {
  final String _urlString = URL;

  Future<Null> _updateToken() async{
    if(!TokenPlayground.updated){
      await TokenPlayground.updateJWT();
    }
  }

  Future<Response> GET({@required String url}) async{
    await _updateToken();
    return await get("$_urlString$url", headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: TokenPlayground.readJWT()
    });}


  Future<Response> POST({@required String url, @required String body}) async{
    await _updateToken();
    return await post("$_urlString$url",
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: TokenPlayground.readJWT()
        },
        body: body
    );}


  /// Singleton Pattern
  CustomNetworkClient._internal();

  static final CustomNetworkClient _instance = CustomNetworkClient._internal();

  /// Returns CustomNetworkClient synchronously
  factory CustomNetworkClient() => _instance;

  /// Returns CustomNetworkClient asynchronously
  /// Ensures that JWT is updated
  static Future<CustomNetworkClient> initialise() async {
    if (!TokenPlayground.updated) {
      await TokenPlayground.updateJWT();
    }
    return _instance;
  }

}
