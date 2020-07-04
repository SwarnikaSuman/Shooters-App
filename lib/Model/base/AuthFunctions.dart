import 'package:shooting_app/Model/base/TokenPlayground.dart';

class AuthFunction{

  bool isLoggedIn()=> TokenPlayground.readJWT()!="";

  Future<bool> storeToken(String JWT) => TokenPlayground.storeJWT(JWT);

  Future<bool> deleteToken() => TokenPlayground.deleteJWT();
}