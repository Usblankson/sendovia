import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/authentication/view_models/forgot_password_vm.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/modules-new/authentication/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/space.dart';
import '../../shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import '../../shared/utils/images.dart';
import '../../shared/utils/navigation.dart';
import 'enter_otp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordViewModel>(
      builder: (context, fgVM, _) {
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
                  AppText('Forgot Password', 18.sp, FontWeight.w600, black, 0, 0.h,
                      null),
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
                    controller: fgVM.emailController,
                    onSaved: ()=> fgVM.notify(),
                  ),
                  VSpace(24.h),
                  CustomButton(
                    title: 'Recover password',
                    onPress: fgVM.forgotPasswordButtonIsEnabled() ? () async {
                      bool isDone = await fgVM.forgot(context);
                    } : () {},
                    isActive: fgVM.forgotPasswordButtonIsEnabled(),
                    isLoading: fgVM.viewState == ViewState.busy,
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
    );
  }
}
