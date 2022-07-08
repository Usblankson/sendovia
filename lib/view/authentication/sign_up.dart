import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/space.dart';
import 'package:sendovia/view/authentication/login.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  'Sign up', 18.sp, FontWeight.w600, black, 0.sp, 0.h, null),
              VSpace(12.h),
              AppText('Enter your details to create an account', 12.sp,
                  FontWeight.w400, supportTextColor, 0, 0.h, null),
              VSpace(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'First Name',
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                    ),
                  ),
                  HSpace(17.w),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Last Name',
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              VSpace(24.h),
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
              VSpace(24.h),
              CustomButton(
                title: 'Create account',
                onPress: () {},
                isActive: true,
                color: primaryColor,
                txtColor: white,
                borderColor: primaryColor,
              ),
              VSpace(24.h),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: supportTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp
                        ),
                        children: [TextSpan(text: 'Login',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp
                          ), recognizer: TapGestureRecognizer()..onTap = (){
                              Nav.forward(context, const LogIn());

                            })])),
              ),
               VSpace(32.h),
              Center(
                child: AppText('By creating an account, you accept our', 14.sp,
                    FontWeight.w400, supportTextColor, 0, 2, null),
              ),
              VSpace(10.h),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Terms of Use ',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp
                        ),
                        children: [
                          TextSpan(text: 'and ',
                            style: TextStyle(
                                color: supportTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp
                            )),
                        const TextSpan(text: 'Privacy Policy'),
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
