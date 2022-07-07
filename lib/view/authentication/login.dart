import 'package:flutter/material.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/view/authentication/forgot_password.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';
import '../app/bottom_tabbar.dart';
import 'sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
              AppText('Log In', 22, FontWeight.w500, black, 0, 3.2, null),
              const YMargin(12),
              AppText('Enter your details to log in', 16, FontWeight.w400,
                  supportTextColor, 0, 2.4, null),
              const YMargin(32),
              CustomTextFormField(
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
              ),
              const YMargin(24),
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
                    size: 22,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText('Forgot Password?', 14, FontWeight.w400, primaryColor,
                      0, 1, () {
                    Nav.forward(context, const ForgotPassword());
                  })
                ],
              ),
              const YMargin(20),
              CustomButton(
                title: 'Log in',
                onPress: () => Nav.forward(context, TabLayout()),
                isActive: true,
                color: primaryColor,
                txtColor: white,
                borderColor: primaryColor,
              ),
              const YMargin(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('Don’t have an account?', 14, FontWeight.w400,
                      supportTextColor, 0, 2.4, null),
                  const XMargin(1),
                  InkWell(
                    onTap: () {
                      // Nav.forward(context, const TermsAndConditions());
                    },
                    child: AppText(
                        ' Sign up',
                        16,
                        FontWeight.w600,
                        primaryColor,
                        0,
                        2.4,
                        () => Nav.forward(context, const SignUp())),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
