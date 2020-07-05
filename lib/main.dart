import 'package:flutter/material.dart';
import 'package:shooting_app/Model/base/AuthFunctions.dart';
import 'package:shooting_app/Model/base/CustomNetworkCliet.dart';
import 'package:shooting_app/Model/database/moor_database.dart';
import 'package:shooting_app/Screens/homepage/homepage.dart';
import 'package:shooting_app/Screens/login/login_screen/login_screen.dart';

void main() async {
  await CustomNetworkClient.initialise();
  bool loggedInStatus = AuthFunction().isLoggedIn();
  if (loggedInStatus) {
    List<UserLogTable> userLogTable = await AppDatabase().userLogDao.userLog;
    if (userLogTable.length > 0) {
      if (userLogTable[0].userType == 1) {
        return runApp(MyApp("LoggedInStudent"));
      } else if (userLogTable[0].userType == 2) {
        return runApp(MyApp("LoggedInCoach"));
      } else if (userLogTable[0].userType == 0) {
        return runApp(MyApp("LoggedInAdmin"));
      }
    }
    await AppDatabase().userLogDao.clearUserLog();
    await AuthFunction().deleteToken();
  }
  return runApp(MyApp("NotLoggedIn"));
}

Widget Home(String initStatus) {
  switch (initStatus) {
    case "NotLoggedIn":
      return SignIn();
      break;
    case "LogggedInStudent":
      return Homepage();
      break;
    default:
      return SignIn();
      break;
  }
}

class MyApp extends StatelessWidget {
  MyApp(this.initStatus);

  final String initStatus;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shooting App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Home(initStatus),
    );
  }
}
