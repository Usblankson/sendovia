import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/shared/utils/images.dart';
import '../../shared/utils/utils.dart';
import 'package:planetx/shared/utils/color.dart';
import 'splash_two.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    const duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreenTwo(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: deviceWidth(context),
        height: deviceHeight(context),
        child: Stack(
          // clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: primaryColor),
              margin: EdgeInsets.all(0.sp),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          textLogo,
                          width: 173.w,
                          height: 42.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 280.h,
              left: 0.w,
              right: 0.w,
              child: Image.asset(
                splashBg1,
                width: MediaQuery.of(context).size.width.w,
                height: 550.h,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 532.h,
              child: Image.asset(
                splashBg2,
                width: MediaQuery.of(context).size.width.w,
                height: 280.h,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
