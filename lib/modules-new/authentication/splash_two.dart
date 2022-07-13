import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/authentication/sign_up.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/modules-new/authentication/widgets/custom_button.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/space.dart';
import 'login.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({Key key}) : super(key: key);

  @override
  _SplashScreenTwoState createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  AppText("Send Gift Anonymously ", 32.sp, FontWeight.w500,
                      white, 0.sp, 0.h, null),
                  VSpace(16.h),
                  AppText(
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint consequat duis enim velit consequat amet dolor. ",
                      16.sp,
                      FontWeight.w400,
                      white,
                      0.sp,
                      0.h,
                      null),
                  VSpace(64.h),
                  CustomButton(
                    title: "Sign Up",
                    onPress: () => Nav.forward(context, const SignUp()),
                    isActive: true,
                    hasElevation: false,
                    txtColor: primaryColor,
                    color: white,
                  ),
                  VSpace(16.h),
                  CustomButton(
                      title: "Log in",
                      onPress: () => Nav.forward(context, const LogIn()),
                      isActive: true,
                      hasElevation: false,
                      txtColor: white,
                      color: primaryColor),
                  VSpace(100.h),
                ],
              ),
            )
          ],
        ));
  }
}
