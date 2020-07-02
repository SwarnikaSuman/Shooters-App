import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shooting_app/Screens/login/register/register.dart';
import 'package:shooting_app/Screens/login/register/register_controller.dart';
import 'package:shooting_app/Screens/values/Strings.dart';

RegisterController registerController = RegisterController();

class RegisterType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return ChangeNotifierProvider.value(
      value: registerController,
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) => Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100 + top, bottom: 80),
                child: ListView(
                  children: <Widget>[
                    withRadio(1, studentDesc, student),
                    withRadio(2, coachDesc, coach),
                    withRadio(0, instituteDesc, institute),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff40dedf), Color(0xff448aff)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(18.0)),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            onPressed: () {
                              if (registerController.userType == 1 ||
                                  registerController.userType == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup(
                                            registerController:
                                                registerController)));
                              } else if (registerController.userType == 0) {
                                //TODO: Attach Google Form
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(milliseconds: 1500),
                                    content: Container(
                                      height: 35,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Select an option",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Center(
                                child: Text(
                              'Proceed',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            )),
                          )))),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: top + 25, left: 20, right: 20),
                  child: Column(
                    children: [
                      Text('Welcome',
                          style: GoogleFonts.openSans(
                              fontSize: 40,
                              color: Color(0xff1b7bba),
                              fontWeight: FontWeight.w300)),
                      Text('Create an Account',
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Color(0xff1b7bba),
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

FlatButton withRadio(int type, String desc, String title) {
  return FlatButton(
    onPressed: () {
      registerController.changeUserType(type);
    },
    child: Column(
      children: [
        Row(
          children: [
            Consumer<RegisterController>(
              builder: (_, regist, child) => Radio(
                value: type,
                groupValue: regist.userType,
                activeColor: Color(0Xff2b9bea),
                onChanged: (value) {
                  regist.changeUserType(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(title,
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontSize: 30)),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 80),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              desc,
            ),
          ),
        ),
      ],
    ),
  );
}
