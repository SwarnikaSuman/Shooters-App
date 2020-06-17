import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String username;
String signupemail;
String signuppass;
String confirmpass;

class Signup extends StatefulWidget {
  @override
  String type;
  Signup({this.type});
  _SignupState createState() => _SignupState(type: type);
}

class _SignupState extends State<Signup> {
  String type;
  _SignupState({this.type});
  final signemail = TextEditingController();
  final signpass = TextEditingController();
  final signname = TextEditingController();
  final cpass = TextEditingController();

  // bool _isButtonDisabled = true;
  // bool _ispasscorrect = false;
  BuildContext scaffoldContext; // for snackbars!

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new Builder(builder: (BuildContext context) {
      //had to use builder to display snackbar
      scaffoldContext = context;
      return Stack(
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
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 200),
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
                  Text(
                    "$type Signup",
                    style: GoogleFonts.openSans(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextFormField(
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                      ),
                      controller: signname,
                      onChanged: (_) {
                        username = signname.text;
                        print(username);
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
                    controller: signemail,
                    onChanged: (_) {
                      signupemail = signemail.text;
                      print(signupemail);
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
                      controller: signpass,
                      onChanged: (_) {},
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
                    child: TextFormField(
                      obscureText: true,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                      ),
                      controller: cpass,
                      onChanged: (_) {},
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
                          labelStyle: GoogleFonts.openSans(fontSize: 15)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff40dedf), Color(0xff0fb2ea)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width,
                                minHeight: 50.0),
                            alignment: Alignment.center,
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
                              recognizer: TapGestureRecognizer()..onTap = () {},
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
      );
    }));
  }
}
