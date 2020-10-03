
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shooting_app/Screens/customwigets/text_input.dart';

class ProfileDisplayOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) =>
            ListView(
              children: <Widget>[
                SizedBox(height:20),
                Text("Hello "),
                InputText(onChanged: (_) {},
                    labelText: "Hello"
                )
              ],
            ),
      ),
    );
  }
}


