import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/space.dart';
import 'package:sendovia/view/authentication/reset_password.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';
import '../../widgets/countdown.dart';

class EnterCode extends StatefulWidget {
  const EnterCode({Key key}) : super(key: key);

  @override
  State<EnterCode> createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> with TickerProviderStateMixin {
  int _counter = 0;
  AnimationController _controller;
  int levelClock = 300;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        shadowColor: appbarShadowColor.withOpacity(0.1),
        toolbarHeight: Platform.isAndroid ? 70.h : 50.h,
        toolbarOpacity: 0.5,
        backgroundColor: white,
        elevation: 1,
        bottomOpacity: 0.1,
        leading: IconButton(
            icon: Image.asset(
              backBtn,
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Nav.back(context);
            }),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VSpace(24.h),
              AppText(
                  'Enter Code', 18.sp, FontWeight.w600, black, 0, 3.2, null),
              VSpace(12.h),
              AppText(
                  'Please enter the 6 digit OTP code sent to kingsleyomin@gmail.com ',
                  16,
                  FontWeight.w400,
                  supportTextColor,
                  0,
                  2.4,
                  null),
              VSpace(32.h),
              CustomTextFormField(
                label: 'OTP',
                keyboardType: TextInputType.number,
                maxLines: 1,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
              ),
              VSpace(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('Code will expire in ', 14.sp, FontWeight.w400,
                      supportTextColor, 0, 0, null),
                  Countdown(
                    animation: StepTween(
                      begin: levelClock, // THIS IS A USER ENTERED NUMBER
                      end: 0,
                    ).animate(_controller),
                  ),
                ],
              ),
              VSpace(24.h),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Didn’t get the code? ',
                        style: TextStyle(
                            color: supportTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp),
                        children: [
                      TextSpan(
                          text: 'Resend Code',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Nav.forward(context, const ResetPassword());
                            })
                    ])),
              ),
              VSpace(24.h),
              CustomButton(
                title: 'Continue',
                onPress: () => Nav.forward(context, const ResetPassword()),
                isActive: true,
                color: primaryColor,
                txtColor: white,
                borderColor: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
