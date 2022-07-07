import 'package:flutter/material.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/view/authentication/login.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/navigation.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

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
              AppText('Sign up', 22, FontWeight.w500, black, 0, 3.2, null),
              const YMargin(12),
              AppText('Enter your details to create an account', 16,
                  FontWeight.w400, supportTextColor, 0, 2.4, null),
              const YMargin(32),
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
                  const XMargin(17),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Last Name',
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              const YMargin(24),
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
              const YMargin(24),
              CustomButton(
                title: 'Create account',
                onPress: () {},
                isActive: true,
                color: primaryColor,
                txtColor: white,
                borderColor: primaryColor,
              ),
              const YMargin(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('Already have an account?', 14, FontWeight.w400,
                      supportTextColor, 0, 2.4, null),
                  const XMargin(1),
                  InkWell(
                       onTap: (){
                        Nav.forward(context, const LogIn());
                       } ,
                    child: AppText('Login', 16, FontWeight.w600, primaryColor,
                        0, 2.4, () {}),
                  ),
                ],
              ),
              const YMargin(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText('By creating an account, you accept our', 14,
                      FontWeight.w400, supportTextColor, 0, 2, null),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           AppText('Terms of Use ', 14, FontWeight.w600, primaryColor,
                        0, 2.4, () {}),
                        const XMargin(1),
                        AppText('and', 14, FontWeight.w400,
                            supportTextColor, 0, 2, null),
                        const XMargin(1),
                            AppText(' Privacy Policy ', 14, FontWeight.w600, primaryColor,
                        0, 2.4, () {}),
                        ],
                      )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
