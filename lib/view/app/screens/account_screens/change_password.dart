import 'package:flutter/material.dart';
import 'package:sendovia/utils/app_text.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/spacing.dart';

import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/navigation.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isCurrentPasswordVisible = false;
  bool isNewPasswordVisible = false;
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
        title: AppText(
          'Change Password',
          18,
          FontWeight.w500,
          black,
          0,
          3.2,
          null,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(32),
              CustomTextFormField(
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
                    size: 22,
                  ),
                ),
              ),
              const YMargin(24),
              CustomTextFormField(
                label: 'New Password',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                obscureText: isCurrentPasswordVisible,
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
                title: 'Current Password',
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
