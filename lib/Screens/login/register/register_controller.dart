import 'package:flutter/cupertino.dart';

class RegisterController extends ChangeNotifier{
  /// 0 for admin, 1 for student, 2 for coach, 3 for staff
  int userType=-1;

  void changeUserType(int value){
    userType=value;
    notifyListeners();
  }

}
