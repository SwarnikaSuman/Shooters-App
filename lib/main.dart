import 'package:flutter/material.dart';
import 'package:shooting_app/Screens/login/login_screen.dart';
import 'package:shooting_app/screens/homepage/homepage.dart';
import 'package:shooting_app/screens/login/register_type.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shooting App',
      // routes: {
      //   '/login': (_) => HomePage(),
      //   '/register': (_) => RegisterType(),
      // },
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SignIn(),
    );
  }
}
