import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shooting_app/screens/profile/profile_controller.dart';

class DecideWhichProfile extends StatelessWidget {
  ProfileController profilecontroller = ProfileController();
  DecideWhichProfile(this.initStatus);
  String initStatus;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shooting App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: profilecontroller.profileRedirect(initStatus),
    );
  }
}
