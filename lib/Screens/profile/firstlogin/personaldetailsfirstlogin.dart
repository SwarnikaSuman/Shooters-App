import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shooting_app/Screens/profile/firstlogin/firstlogincontroller.dart';

class FirstLogin extends StatelessWidget {
  final String profileName;

  FirstLogin(this.profileName);

  final FirstLoginController _firstLoginController = FirstLoginController();
  final ImagePicker picker = ImagePicker();

  Future<String> getImageinBase64(bool camera) async {
    final image = await picker.getImage(
        source: camera ? ImageSource.camera : ImageSource.gallery);
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  }

  @override
  Widget build(BuildContext context) {
    // Not at all an expensive work
    _firstLoginController.profileName = profileName;

    return Scaffold(
      body: Builder(builder: (BuildContext context) => Container()),
    );
  }
}


