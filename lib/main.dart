import 'package:flutter/material.dart';
import 'package:shooting_app/Screens/login/login_screen.dart';
import 'package:shooting_app/Screens/login/register_type.dart';
import 'package:shooting_app/Screens/splash/splash_screen.dart';


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
      home:SignIn(),
    );
  }
}