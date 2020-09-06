import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shooting_app/Screens/login/login_screen/login_screen.dart';
import 'package:shooting_app/Screens/login/register/register_controller.dart';
import 'package:shooting_app/Screens/profile/firstlogin/personaldetailsfirstlogin.dart';

class RegisterDetails extends StatelessWidget {
  RegisterDetails({@required this.registerController});

  RegisterController registerController;
  String rangeName = "";
  String userMob = "";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final top = MediaQuery.of(context).padding.top;
    rangeName = registerController.rangeName;
    userMob = registerController.userMob;

    return ChangeNotifierProvider.value(
      value: registerController,
      child: Scaffold(
        //This builder is used to implement snackbar!
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
              Container(
                margin: EdgeInsets.only(top: top + 0.15 * height),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListView(
                    padding: EdgeInsets.only(top: 5),
                    children: <Widget>[
                      Row(children: [
                        Text(
                          "Sign up as a ${(registerController.userType == 1) ? 'Student' : 'Coach'}",
                          style: GoogleFonts.openSans(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Consumer<RegisterController>(
                                builder: (context, notif, child) => notif
                                        .isLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : child,
                                child: Container()))
                      ]),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                        child: TextFormField(
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                          ),
                          onChanged: (_) {
                            rangeName = _;
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
                              labelText: 'Range Name',
                              prefixIcon: Icon(Icons.adjust),
                              labelStyle: GoogleFonts.openSans(fontSize: 15)),
                        ),
                      ),
                      TextFormField(
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                        ),
                        onChanged: (_) {
                          userMob = _;
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
                          labelText: 'Mobile',
                          prefixIcon: Icon(Icons.phone),
                          labelStyle: GoogleFonts.openSans(fontSize: 15),
                        ),
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
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (registerController.secondSignUp(
                                  rangeName, userMob)) {
                                String error =
                                    await registerController.register();
                                if (error == "") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FirstLogin(),
                                    ),
                                  );
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("$error",
                                          style: TextStyle(fontSize: 16))));
                                }
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Fill the details",
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
                            text: TextSpan(
                              children: [
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
                                              builder: (context) => SignIn()),
                                          (_) => false);
                                    },
                                  style: GoogleFonts.openSans(
                                    color: Color(0xff0fb2ea),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
