import 'package:flutter/material.dart';
import 'package:shooting_app/screens/profile/firstlogin/personaldetailsfirstlogin.dart';
import 'package:shooting_app/screens/profile/profile_screen/profile_screen.dart';
import 'package:shooting_app/screens/profile/profileedit/profile_edit.dart';

class ProfileController {
  // 0 for profile just after registration
  // 1 for just displaying profile
  // 2 for when editing profile
  int profiletype;

  // ignore: missing_return
  Widget profileRedirect(String initStatus) {
    switch (initStatus) {
      case "ProfileFillDetails":
        {
          profiletype = 0;
          return FirstLogin();
        }
        break;
      case "ProfileDisplay":
        {
          profiletype = 1;
          return ProfileDisplayOnly();
        }
        break;
      case "ProfileEdit":
        {
          profiletype = 2;
          return ProfileEditPage();
        }
        break;
    }
  }
}
