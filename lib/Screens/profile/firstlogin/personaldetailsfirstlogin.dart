import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shooting_app/Screens/customwigets/text_input.dart';
import 'package:shooting_app/Screens/profile/firstlogin/firstlogincontroller.dart';

class FirstLogin extends StatelessWidget {
  final String profileName;

  FirstLogin(this.profileName);

  FirstLoginController _firstLoginController = FirstLoginController();

  @override
  Widget build(BuildContext context) {
    // Not at all an expensive work
    _firstLoginController.profileName = profileName;

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) => ListView(
          children: <Widget>[
            Text("Hello "),
            InputText(onChanged: (_) {}, labelText: "Hello")
          ],
            ),
      ),
    );
  }
}


