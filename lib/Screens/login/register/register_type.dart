import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shooting_app/Screens/login/register/register_controller.dart';
import 'package:shooting_app/Screens/values/Strings.dart';
import 'package:shooting_app/screens/register/register_student.dart';


class RegisterType extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return ChangeNotifierProvider(create: (context) => RegisterController(),child: Scaffold(
        body: Stack(children: [
      Padding(
        padding: EdgeInsets.only(top: 100 + top, bottom: 80),
        child: ListView(
          children: <Widget>[
            Column(children: [
              Row(children: [
                Consumer<RegisterController>(builder:(_, regist, child)=>Radio(
                  value: 1,
                  groupValue: regist.userType,
                  activeColor: Color(0Xff2b9bea),
                  onChanged: regist.changeUserType,
                )),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(student,
                      style: GoogleFonts.openSans(
                          color: Colors.black, fontSize: 30)),
                )
              ]),
              Padding(
                  padding:
                      EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 80),
                  child: Align(
                      alignment: Alignment.topLeft, child: Text(studentDesc)))
            ]),
            Column(children: [
              Row(children: [
    Consumer<RegisterController>(builder:(_, regist, child)=>Radio(
                  value: 2,
                  groupValue: regist.userType,
                  activeColor: Color(0Xff2b9bea),
                  onChanged: regist.changeUserType,
                )),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      coach,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ))
              ]),
              Padding(
                  padding:
                      EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 80),
                  child: Align(
                      alignment: Alignment.topLeft, child: Text(coachDesc)))
            ]),
            Column(children: [
   Row(children: [
     Consumer<RegisterController>(builder:(_, regist, child)=>Radio(
                  value: 0,
                  groupValue: regist.userType,
                  activeColor: Color(0Xff2b9bea),
                  onChanged: regist.changeUserType,
                )),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      institute,
                      style: GoogleFonts.openSans(
                          color: Colors.black, fontSize: 30),
                    ))
              ]),
              Padding(
                  padding:
                      EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 80),
                  child: Align(
                      alignment: Alignment.topLeft, child: Text(instituteDesc)))
            ]),
          ],
        ),
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Padding(padding: EdgeInsets.all(10),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signup(type: Provider.of<RegisterController>(context).userType.toString())));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
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
            child: Column(children: [
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
            ])),
      ),
    ])));

  }
}
