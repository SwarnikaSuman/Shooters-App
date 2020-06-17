import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shooting_app/Screens/login/login_screen/login_screen.dart';
import 'package:shooting_app/Screens/login/register/register_controller.dart';
import 'package:shooting_app/Screens/login/register/register_details.dart';

class Signup extends StatelessWidget {
  Signup({@required this.registerController});

  RegisterController registerController;
  String username = "";
  String signupemail = "";
  String signuppass = "";
  String confirmpass = "";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final top = MediaQuery.of(context).padding.top;

    return ChangeNotifierProvider.value(
        value: registerController,
        child: Scaffold(
            body: Builder(
                builder: (BuildContext context) => Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff2B32B2),
                                Color(0xff1488CC),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 50),
          //   height: 100,
          //   child: Center(
          //     child: Image.asset(
          //       "assets/image1.png",
          //     ),
          //   ),
          // ),
          Container(

            margin: EdgeInsets.only(top: top + 0.15 * height),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ListView(
                padding: EdgeInsets.only(top: 5),
                children: <Widget>[
                  Consumer<RegisterController>(builder: (_, regist, child) =>
                      Text(
                        "Sign up as a ${regist.userType == 1
                            ? 'Student'
                            : 'Coach'}",
                        style: GoogleFonts.openSans(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: TextFormField(
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                      ),
                      onChanged: (_) {
                        username = _;
                      },
                      decoration: InputDecoration(
                          fillColor: Color(0xfff5f5f5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person_outline),
                          labelStyle: GoogleFonts.openSans(fontSize: 15)),
                    ),
                  ),
                  TextFormField(
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                    ),
                    onChanged: (_) {
                      signupemail = _;
                    },
                    decoration: InputDecoration(
                        fillColor: Color(0xfff5f5f5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        labelStyle: GoogleFonts.openSans(fontSize: 15)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      obscureText: true,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                      ),
                      onChanged: (_) {
                        signuppass = _;
                        if (confirmpass.isNotEmpty) {
                          registerController.confirmPassword(_, confirmpass);
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Color(0xfff5f5f5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: GoogleFonts.openSans(fontSize: 15)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Consumer<RegisterController>(builder: (_, regist,
                        child) =>
                        TextFormField(
                          obscureText: true,
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                          ),
                          onChanged: (_) {
                            confirmpass = _;
                            regist.confirmPassword(signuppass, _);
                          },
                          decoration: InputDecoration(
                              fillColor: Color(0xfff5f5f5),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: regist.confirmedPassword
                                  ? null
                                  : Icon(Icons.error),
                              labelStyle: GoogleFonts.openSans(fontSize: 15)),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff40dedf), Color(0xff448aff)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(18.0)),
                      height: 50.0,
                      child: FlatButton(
                        onPressed: () {
                          if (registerController.confirmedPassword) {
                            if (registerController.signUp(
                                username, signupemail, signuppass)) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterDetails(
                                          registerController: registerController)));
                            } else {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Fill the details",
                                      style: TextStyle(fontSize: 16))));
                            }
                          } else {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Password doesn't match",
                                    style: TextStyle(fontSize: 16))));
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(18))),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Already have an account?  ",
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          TextSpan(
                              text: "Sign In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignIn()),
                                          (_) => false
                                  );
                                },
                              style: GoogleFonts.openSans(
                                color: Color(0xff0fb2ea),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ))
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
          ],
        )
    )));
  }
}
