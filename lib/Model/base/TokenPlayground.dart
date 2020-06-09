import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenPlayground{
  String _JWT="";
  bool updated=false;

  /// JWT Functions
  void updateJWT() {
    FlutterSecureStorage().read(key: "JWT").
    then((onValue) {
      _JWT=onValue;
      updated=true;
    }).catchError((onError){
      updateJWT();
    });
  }


  String readJWT() => _JWT;

  Future<bool> storeJWT(String JWT) =>
      FlutterSecureStorage().write(key: "JWT", value: JWT).
      then((onValue) {
        _JWT=JWT;
        return true;
      }).catchError((onError) => false);

  Future<bool> deleteJWT() =>
      FlutterSecureStorage().delete(key: "JWT").
      then((onValue){
        _JWT="";
        return true;
      }).catchError((onError) => false);

}