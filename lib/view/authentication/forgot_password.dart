import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/space.dart';
import 'package:sendovia/view/authentication/enter_otp.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isVisible = false;
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
              AppText(
                  'Forgot Password', 18.sp, FontWeight.w600, black, 0, 0.h, null),
              VSpace(12.h),
              AppText(
                  'Please enter your registered email address to reset your password',
                  16.sp,
                  FontWeight.w400,
                  supportTextColor,
                  0,
                  0,
                  null),
              VSpace(32.h),
              CustomTextFormField(
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
              ),
              VSpace(24.h),
              CustomButton(
                title: 'Recover password',
                onPress: () => Nav.forward(context,const EnterCode()),
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
