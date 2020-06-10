import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';

String emailuser = '';
String passuser = '';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new Builder(builder: (BuildContext context) {
      final width=MediaQuery.of(context).size.width;
      final height=MediaQuery.of(context).size.height;
      final top= MediaQuery.of(context).padding.top;
      return Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff448aff), Color(0xfff48fb1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: top+0.05*height),
            height:0.2*height,
            child: Center(child: Image.asset('assets/logo.png')),
          ),
          Container(
            width:width,
            margin: EdgeInsets.only(top: top+ 0.3*height),
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
                    "Login",
                    style: GoogleFonts.openSans(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextFormField(
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                      ),
                      controller: email,
                      onChanged: (_) {
                        emailuser = email.text;
                        print(emailuser);
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
                          labelText: 'email',
                          prefixIcon: Icon(Icons.person_outline),
                          labelStyle: GoogleFonts.openSans(fontSize: 15)),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                    ),
                    controller: password,
                    onChanged: (_) {
                      passuser = password.text;
                      print(passuser);
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
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff40dedf), Color(0xff448aff)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(18.0)),
                      height: 50.0,
                      child: FlatButton(
                      onPressed: () {},
                        child: Center(
                          child: Text(
                            "Login",
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
                    padding: EdgeInsets.only(top: 20),
                    child:Container(
                      width:width,
                      decoration: BoxDecoration(
                          color:Colors.white,
                          border:Border.all(color:Color.fromARGB(255, 150, 150, 150)),
                          borderRadius: BorderRadius.circular(18.0)),
                      height: 50.0, child: FlatButton(
                      onPressed: () {},
                        child: Expanded(child:Stack(children: [
                          Positioned(
                            child: Image.asset('assets/google.png'),
                            left: 10,
                            height: 50,
                          ),
                          Center(
                                child: Text("Login Using Google",
                                    style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      color: Colors.black,
                                    )),
                              )
                        ]),
                      ),)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot your password?',
                          style: GoogleFonts.openSans(
                            fontSize: 15,
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
                              text: "Don't have an account? ",
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          TextSpan(
                              text: "Sign Up",
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
