import 'package:flutter/material.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/view/authentication/forgot_password.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        shadowColor: appbarShadowColor.withOpacity(0.1),
        toolbarHeight: 70,
        toolbarOpacity: 0.5,
        backgroundColor: white,
        elevation: 3,
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
            children: [
              const YMargin(24),
              AppText('Reset Password', 22, FontWeight.w500, black, 0, 3.2, null),
              const YMargin(12),
              AppText('Please enter your new password', 16, FontWeight.w400,
                  supportTextColor, 0, 2.4, null),
              const YMargin(32),
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
                    size: 22,
                  ),
                ),
              ),
              const YMargin(24),
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
                    size: 22,
                  ),
                ),
              ),
              const YMargin(24),
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
