import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/bottom_tabbar.dart';
import 'package:planetx/modules-new/utils/colors.dart';
import 'package:planetx/modules-new/widgets/custom_button.dart';
import 'package:planetx/modules-new/widgets/custom_text_form_field.dart';

import '../../shared/widgets/space.dart';
import '../utils/app_text.dart';
import '../utils/images.dart';
import '../utils/navigation.dart';
import 'forgot_password.dart';
import 'sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isVisible = true;
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
              width: 24.w,
              height: 24.h,
            ),
            onPressed: () {
              Nav.back(context);
            }),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(24.h),
              AppText('Log In', 18.sp, FontWeight.w600, black, 0, 0, null),
              VSpace(12.h),
              AppText('Enter your details to log in', 16.sp, FontWeight.w400,
                  supportTextColor, 0, 0, null),
              VSpace(32.h),
              CustomTextFormField(
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
              ),
              VSpace(24.h),
              CustomTextFormField(
                label: 'Password',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                obscureText: isVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(
                    isVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: supportTextColor,
                    size: 22.sp,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText('Forgot Password?', 14.sp, FontWeight.w400,
                      primaryColor, 0, 0, () {
                    Nav.forward(context, const ForgotPassword());
                  })
                ],
              ),
              VSpace(20.h),
              CustomButton(
                title: 'Log in',
                onPress: () => Nav.forward(context, TabLayout()),
                isActive: true,
                color: primaryColor,
                txtColor: white,
                borderColor: primaryColor,
              ),
              VSpace(24.h),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(
                            color: supportTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp),
                        children: [
                      TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Nav.forward(context, const SignUp());
                            })
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
