import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/space.dart';
import 'package:sendovia/view/authentication/forgot_password.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
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
              width: 24.h,
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
              AppText('Reset Password', 18.sp, FontWeight.w600, black, 0, 3.2, null),
              VSpace(12.h),
              AppText('Please enter your new password', 16.sp, FontWeight.w400,
                  supportTextColor, 0, 2.4, null),
              VSpace(32.h),
               CustomTextFormField(
                label: 'Password',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                obscureText: isPasswordVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: Icon(
                    isPasswordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: supportTextColor,
                    size: 22.sp,
                  ),
                ),
              ),
              VSpace(24.h),
              CustomTextFormField(
                label: 'Confirm Password',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                obscureText: isConfirmPasswordVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: supportTextColor,
                    size: 22.sp,
                  ),
                ),
              ),
              VSpace(24.h),
              CustomButton(
                title: 'Reset password',
                onPress: () {},
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
