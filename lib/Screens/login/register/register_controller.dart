import 'package:flutter/cupertino.dart';

class RegisterController extends ChangeNotifier{
  /// 0 for admin, 1 for student, 2 for coach, 3 for staff
  int userType = -1;
  bool confirmedPassword = true;

  String Name = "";
  String Email = "";
  String Password = "";

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

  bool signUp(String Name, String Email, String Password) {
    if (Name.isNotEmpty && Email.isNotEmpty && Password.isNotEmpty) {
      this.Name = Name;
      this.Email = Email;
      this.Password = Password;
      return true;
    }
    return false;
  }
}
