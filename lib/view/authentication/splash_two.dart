import 'package:flutter/material.dart';
import 'package:sendovia/utils/app_text.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/view/authentication/sign_up.dart';
import 'package:sendovia/widgets/custom_button.dart';

import '../../utils/colors.dart';
import '../../utils/navigation.dart';
import 'login.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AppText("Send Gift Anonymously ", 32, FontWeight.w600, white,
                      10, 0, null),
                  const YMargin(16),
                  AppText(
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint consequat duis enim velit consequat amet dolor. ",
                      16,
                      FontWeight.w400,
                      white,
                      0,
                      2.4, null),
                  const YMargin(64),
                  CustomButton(
                    title: "Sign Up",
                    onPress: () => Nav.forward(context, const SignUp()),
                    isActive: true,
                    hasElevation: false,
                    txtColor: primaryColor,
                    color: white,
                  ),
                  const YMargin(16),
                  CustomButton(
                      title: "Log in",
                      onPress: () =>  Nav.forward(context,  const LogIn()),
                      isActive: true,
                      hasElevation: false,
                      txtColor: white,
                      color: primaryColor),
                  const YMargin(100),
                ],
              ),
            )
          ],
        ));
  }
}
