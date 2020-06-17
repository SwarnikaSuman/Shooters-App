import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shooting_app/Screens/login/login_screen/login_controller.dart';
import 'package:shooting_app/Screens/login/login_screen/login_screen.dart';

void main() => runApp(MyApp());

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
