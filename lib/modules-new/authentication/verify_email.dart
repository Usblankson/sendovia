import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/authentication/view_models/auth_vm.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/modules-new/bottom_tabbar.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/modules-new/authentication/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/space.dart';
import '../../shared/utils/app_text.dart';
import '../../shared/utils/images.dart';
import '../../shared/utils/navigation.dart';
import 'forgot_password.dart';
import 'sign_up.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  // bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authVM, _) {
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
                  AppText('Verify Account', 18.sp, FontWeight.w600, black, 0, 0, null),
                  VSpace(12.h),
                  AppText('Enter your email to verify account', 16.sp, FontWeight.w400,
                      supportTextColor, 0, 0, null),
                  VSpace(32.h),
                  CustomTextFormField(
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    controller: authVM.emailController,
                    onSaved: ()=> authVM.notify(),
                  ),
                  VSpace(24.h),
                  CustomTextFormField(
                    label: 'Token',
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    // obscureText: authVM.isVisiblePassword,
                    controller: authVM.tokenController,
                    onSaved: ()=> authVM.notify(),
                    // suffixIcon: InkWell(
                    //   onTap: () {
                    //    authVM.visiblePassword();
                    //   },
                    //   child: Icon(
                    //     authVM.isVisiblePassword
                    //         ? Icons.visibility_off_outlined
                    //         : Icons.visibility_outlined,
                    //     color: supportTextColor,
                    //     size: 22.sp,
                    //   ),
                    // ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     AppText('Forgot Password?', 14.sp, FontWeight.w400,
                  //         primaryColor, 0, 0, () {
                  //       Nav.forward(context, const ForgotPassword());
                  //     })
                  //   ],
                  // ),
                  VSpace(20.h),
                  VSpace(20.h),
                  CustomButton(
                    title: 'Verify Email',
                    onPress: authVM.verifyEmailButtonIsEnabled() ? () async {
                      bool isDone = await authVM.verifyEmail(context);
                    } : (){},
                        // () => Nav.forward(context, TabLayout()),
                    isActive: authVM.verifyEmailButtonIsEnabled(),
                    isLoading: authVM.viewState == ViewState.busy,
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
    );
  }
}
