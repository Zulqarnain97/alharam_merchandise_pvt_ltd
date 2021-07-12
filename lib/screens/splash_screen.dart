import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> DashBoard()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //const Color(0xff132B5E),
      body: Center(
          child: Container(
        height: 20.0.h,
        width: 90.0.w,
        child: Container(
            child: Image.asset(
          'assets/logo.png',
        )),
      )),
    );
  }
}
