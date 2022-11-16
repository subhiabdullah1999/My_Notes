import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  double sizefont = 0.0;

  Timer() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        sizefont = 30;
      });
    });
  }

  timerSplash() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacementNamed("loginScreen");
    });
  }

  @override
  void initState() {
    timerSplash();
    Timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                child: Image(
                  image: AssetImage("assets/images/splashim.png"),
                ),
              ),
              AnimatedDefaultTextStyle(
                child: Text("My Notes"),
                style: TextStyle(
                    fontFamily: "Courgette-Regular",
                    fontSize: sizefont,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                duration: Duration(seconds: 2),
                curve: Curves.easeInToLinear,
              ),
              const SizedBox(
                height: 30,
              ),
              const CupertinoActivityIndicator(
                radius: 25,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
