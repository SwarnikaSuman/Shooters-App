import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shooting_app/Model/base/TokenPlayground.dart';
import 'package:shooting_app/Model/base/constants.dart';
import 'dart:io';

class CustomNetworkClient  {
  final String _urlString= URL;
  final TokenPlayground _tokenPlayground =TokenPlayground();

  bool checkUpdateStatus() => _tokenPlayground.updated;

  Future<Response> GET(@required String url) async =>
    await get("$_urlString$url", headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: _tokenPlayground.readJWT()
    });


  Future<Response> POST(@required String url, @required String body) async =>
    await post("$_urlString$url",
      headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: _tokenPlayground.readJWT()
      },
      body: body
    );

  Future<bool> storeToken(String JWT) => _tokenPlayground.storeJWT(JWT);

  Future<bool> deleteToken() => _tokenPlayground.deleteJWT();

  /// Singleton Pattern
  CustomNetworkClient._internal(){
    _tokenPlayground.updateJWT();
  }
  static final CustomNetworkClient _instance = CustomNetworkClient._internal();
  factory CustomNetworkClient() => _instance;

}
