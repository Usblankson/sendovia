import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/account_module/viewModel/change_password_vm.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/modules-new/authentication/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/space.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isCurrentPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordViewModel>(
        builder: (context, changePasswordVM, _) {
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
            title: AppText(
              'Change Password',
              18.sp,
              FontWeight.w600,
              black,
              0,
              0,
              null,
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VSpace(32.h),
                  CustomTextFormField(
                    controller: changePasswordVM.oldPasswordController,
                    onSaved: ()=> changePasswordVM.notify(),
                    label: 'Current Password',
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    obscureText: isCurrentPasswordVisible,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isCurrentPasswordVisible = !isCurrentPasswordVisible;
                        });
                      },
                      child: Icon(
                        isCurrentPasswordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: supportTextColor,
                        size: 22.sp,
                      ),
                    ),
                  ),
                  VSpace(24.h),
                  CustomTextFormField(
                    controller: changePasswordVM.newPasswordController,
                    onSaved: ()=> changePasswordVM.notify(),
                    label: 'New Password',
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    obscureText: isNewPasswordVisible,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isNewPasswordVisible = !isNewPasswordVisible;
                        });
                      },
                      child: Icon(
                        isNewPasswordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: supportTextColor,
                        size: 22.sp,
                      ),
                    ),
                  ),
                  VSpace(24.h),
                  CustomTextFormField(
                    controller: changePasswordVM.confirmPasswordController,
                    onSaved: ()=> changePasswordVM.notify(),
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
                    title: 'Current Password',
                    onPress: changePasswordVM.changePasswordButtonIsEnabled()
                      ? () async {
                      bool isDone = await changePasswordVM.changePassword(context);
                    }
                        : () {},
                    isActive: changePasswordVM.changePasswordButtonIsEnabled(),
                    isLoading: changePasswordVM.viewState == ViewState.busy,
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
