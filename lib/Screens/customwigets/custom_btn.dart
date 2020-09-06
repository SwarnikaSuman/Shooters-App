import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomButtom(
        {@required double width, @required String text, double height}) =>
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
            height: height ?? 50.0,
            child: FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Center(
                child: Text(
                  "Login",
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )));
