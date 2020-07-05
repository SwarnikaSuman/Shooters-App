import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shooting_app/Screens/customwigets/text_input.dart';
import 'package:shooting_app/Screens/login/login_screen/login_controller.dart';
import 'package:shooting_app/Screens/login/register/register_type.dart';

class SignIn extends StatelessWidget {
  String emailuser = '';
  String passuser = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final top = MediaQuery.of(context).padding.top;

    return ChangeNotifierProvider(
        create: (context) => LoginNotifier(),
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
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: top + 0.05 * height),
                          height: 0.2 * height,
                          // child: Center(child: Image.asset('assets/logo.png')),
                        ),
                        Container(
                          width: width,
                          margin: EdgeInsets.only(top: top + 0.3 * height),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: ListView(
                              padding: EdgeInsets.only(top: 5),
                              children: <Widget>[
                                Stack(children: [
                                  Text(
                                    "Login",
                                    style: GoogleFonts.openSans(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Consumer<LoginNotifier>(
                                      builder: (context, notif, child) => notif
                                              .isLoading
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : child,
                                      child: Container())
                                ]),
                                //isLoading ?  Center(child: CircularProgressIndicator()) : Container()]),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    child: InputText(
                                        onChanged: (_) {
                                          emailuser = _;
                                        },
                                        labelText: 'Email')),
                                InputText(
                                    onChanged: (_) {
                                      passuser = _;
                                    },
                                    obscureText: true,
                                    labelText: 'Password'),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xff40dedf),
                                            Color(0xff448aff)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0)),
                                    height: 50.0,
                                    child: FlatButton(
                                      onPressed: () async {
                                        if (emailuser.isEmpty ||
                                            passuser.isEmpty) {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      "Enter Credentials")));
                                        } else {
                                          String error =
                                              await Provider.of<LoginNotifier>(
                                                      context,
                                                      listen: false)
                                                  .login(
                                                      email: emailuser,
                                                      password: passuser);
                                          if (error != "") {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(error),
                                            ));
                                          } else {}
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18))),
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
                                  child: Container(
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 150, 150, 150)),
                                          borderRadius:
                                              BorderRadius.circular(18.0)),
                                      height: 50.0,
                                      child: FlatButton(
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18))),
                                        child: Row(children: [
                                          Flexible(
                                              flex: 3,
                                              child: Align(
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Image.asset(
                                                          'assets/google.png')),
                                                  alignment:
                                                      Alignment.centerRight)),
                                          Flexible(
                                              flex: 7,
                                              child: Text("Login Using Google",
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  )))
                                        ]),
                                      )),
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
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RegisterType()));
                                              },
                                            style: GoogleFonts.openSans(
                                              color: Color(0xff2b9bea),
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
                        ),
                      ],
                    ))));
  }
}
