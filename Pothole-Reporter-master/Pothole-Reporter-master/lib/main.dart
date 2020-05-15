import 'package:flutter/material.dart';
//import 'package:pothole_reporter/newlogin.dart';
import 'home1.dart';
import 'login1.dart';
import 'signup.dart';
import 'detected.dart';
import 'otpgen.dart';
import 'notdetected.dart';
//import 'location.dart';
//import 'package:starflut/starflut.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        /* '/harsha': (BuildContext context) => MyApp1(),
        '/viswa': (BuildContext context) => MyApp2(),*/
        '/home1': (BuildContext context) => home1(),
        '/login' : (BuildContext  context) => LoginScreen1(),
        '/otp' :(BuildContext context) => otpgen(),
        '/signup': (BuildContext  context) => Signup(),
      },
      home: LoginScreen1(),
    ),
  }
}


