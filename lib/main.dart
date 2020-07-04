import 'package:flutter/material.dart';
import 'package:shooting_app/Model/base/AuthFunctions.dart';
import 'package:shooting_app/Model/base/CustomNetworkCliet.dart';
import 'package:shooting_app/Screens/login/login_screen/login_screen.dart';

void main() async {
  await CustomNetworkClient.initialise();
  bool loggedInStatus = AuthFunction().isLoggedIn();
  //TODO: Check loggedInStatus to determine initial screen
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shooting App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SignIn(),
    );
  }
}
