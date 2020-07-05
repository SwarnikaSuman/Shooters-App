import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget InputText(
        {void onChanged(String value), String labelText, bool obscureText}) =>
    TextFormField(
      obscureText: obscureText,
      style: GoogleFonts.openSans(
        color: Colors.black,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
          fillColor: Color(0xfff5f5f5),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          labelText: labelText,
          prefixIcon: Icon(Icons.person_outline),
          labelStyle: GoogleFonts.openSans(fontSize: 15)),
    );
