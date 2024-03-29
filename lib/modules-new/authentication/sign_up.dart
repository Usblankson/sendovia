import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/authentication/verify_email.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/modules-new/authentication/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../shared/utils/textfield_helper.dart';
import '../../shared/widgets/space.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterViewModel>(
      builder: (context, regVM, _) {
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
                          controller: regVM.firstNameController,
                          onSaved: () => regVM.notify(),
                        ),
                      ),
                      HSpace(17.w),
                      Expanded(
                        child: CustomTextFormField(
                          label: 'Last Name',
                          keyboardType: TextInputType.text,
                          controller: regVM.lastNameController,
                          maxLines: 1,
                          onSaved: () => regVM.notify(),
                        ),
                      )
                    ],
                  ),
                  VSpace(24.h),
                  CustomTextFormField(
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    controller: regVM.emailController,
                    onSaved: () => regVM.notify(),
                  ),
                  VSpace(24.h),
                  CustomTextFormField(
                    label: 'Phone number',
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    controller: regVM.phoneNumberController,
                    onSaved: () => regVM.notify(),
                    inputFormatters: inputFormatter(KeyboardType.phone),
                  ),
                  VSpace(24.h),
                  CustomTextFormField(
                    label: 'Password',
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    obscureText: regVM.isVisiblePassword,
                    controller: regVM.passwordController,
                    onSaved: () => regVM.notify(),
                    suffixIcon: InkWell(
                      onTap: ()=> regVM.visiblePassword(),
                      child: Icon(
                        regVM.isVisiblePassword
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
                    isLoading: regVM.viewState == ViewState.busy,
                    onPress: regVM.signupButtonIsEnabled() ? () async {
                      bool isDone = await regVM.register(context);
                      debugPrint("is return reg $isDone");
                    } : () {},
                    isActive: regVM.signupButtonIsEnabled(),
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
                                fontSize: 14.sp),
                            children: [
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Nav.forward(context, const VerifyEmail());
                                })
                        ])),
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
                                fontSize: 14.sp),
                            children: [
                          TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                  color: supportTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp)),
                          const TextSpan(text: 'Privacy Policy'),
                        ])),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
