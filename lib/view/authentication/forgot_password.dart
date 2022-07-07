import 'package:flutter/material.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/view/authentication/enter_otp.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
              AppText(
                  'Forgot Password', 22, FontWeight.w500, black, 0, 3.2, null),
              const YMargin(12),
              AppText(
                  'Please enter your registered email address to reset your password',
                  16,
                  FontWeight.w400,
                  supportTextColor,
                  0,
                  2.4,
                  null),
              const YMargin(32),
              CustomTextFormField(
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
              ),
              const YMargin(24),
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
