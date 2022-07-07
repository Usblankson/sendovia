import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sendovia/utils/images.dart';

import '../../utils/colors.dart';
import 'splash_two.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
   startTimer();
  }

  startTimer(){
    const duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const SplashScreenTwo(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration:  BoxDecoration(color: primaryColor),
            margin: const EdgeInsets.all(0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                    Center(
                      child:  Image.asset(textLogo, width: 173, height: 42,),
                    ),
                  ],
                ),
              ),
             
            ],
          ),
          Positioned(
             top: 280,
            child: Image.asset(splashBg1, width: MediaQuery.of(context).size.width, height: 550,),),
            Positioned(
             top:532,
             child: Image.asset(splashBg2, width: MediaQuery.of(context).size.width, height: 280,),),
        ],
      ),
    );
  }
}