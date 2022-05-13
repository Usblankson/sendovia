import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/modules/auth/widgets/textform_field_with_icon.dart';
import 'package:planetx/modules/onBoarding/view_models/register_view_model.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/utils/validator.dart';
import 'package:planetx/shared/widgets/base_view.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/loading_overlay.dart';
import 'package:planetx/shared/widgets/space.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpUser extends StatelessWidget with InputValidationMixin {
  SignUpUser({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _firstNameControl = TextEditingController();
  // final TextEditingController _lastControl = TextEditingController();
  // final TextEditingController _emailControl = TextEditingController();
  // final TextEditingController _passwordControl = TextEditingController();
  // final TextEditingController _confirmPasswordControl = TextEditingController();

  /// for quick test
  final TextEditingController _firstNameControl =
      TextEditingController(text: "john");
  final TextEditingController _lastControl = TextEditingController(text: "doe");
  final TextEditingController _emailControl =
      TextEditingController(text: "wee@fg.com");
  final TextEditingController _passwordControl =
      TextEditingController(text: "P@ss1234");
  final TextEditingController _confirmPasswordControl =
      TextEditingController(text: "P@ss1234");

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      vmBuilder: (context) => RegisterViewModel(authService: si.authService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, RegisterViewModel viewModel) {
    // ScreenUtil.init(
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const LoadingOverlay(
        image: "shopping-bag",
        text: "You’re all set, start sending gifts",
      ),
      overlayOpacity: 0.8,
      child: Scaffold(
        backgroundColor: backGroundGrey,
        body: SafeArea(
          child: Container(
            width: deviceWidth(context),
            height: deviceHeight(context),
            child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 24.h),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/signup-bg.png",
                            ),
                            fit: BoxFit.contain)),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Styles.bold("Sign up",
                                    fontSize: 24.sp, color: bunkerDark),
                                Image.asset(
                                  "assets/images/Logo.png",
                                  height: 18.h,
                                  width: 78.w,
                                )
                              ],
                            ),
                            VSpace(50.h),
                            Styles.regular("First Name", color: black),
                            VSpace(12.h),
                            TextFormFieldWithIcon(
                              controller: _firstNameControl,
                              validator: fieldValidate,
                              // prefixIcon: Icon(Icons.person),
                              // suffixIcon: Icon(Icons.person),
                            ),
                            VSpace(24.h),
                            Styles.regular("Last Name", color: black),
                            VSpace(12.h),
                            TextFormFieldWithIcon(
                              controller: _lastControl,
                              validator: fieldValidate,
                              // prefixIcon: Icon(Icons.person),
                              // suffixIcon: Icon(Icons.person),
                            ),
                            VSpace(24.h),
                            Styles.regular("Email", color: black),
                            VSpace(12.h),
                            TextFormFieldWithIcon(
                              controller: _emailControl,
                              validator: validateEmail,
                              // prefixIcon: Icon(Icons.person),
                              // suffixIcon: Icon(Icons.person),
                            ),
                            VSpace(24.h),
                            Styles.regular("Password", color: black),
                            VSpace(12.h),
                            TextFormFieldWithIcon(
                              controller: _passwordControl,
                              validator: validatePassword,
                              obscureText: viewModel.isVisiblePassword,
                              // prefixIcon: Icon(Icons.lock),
                              suffixIcon: InkWell(
                                      onTap: ()=> viewModel.visiblePassword(),
                                      child: Icon(!viewModel.isVisiblePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                            ),
                            VSpace(24.h),
                            Styles.regular("Confirm Password", color: black),
                            VSpace(12.h),
                            TextFormFieldWithIcon(
                              controller: _confirmPasswordControl,
                              obscureText: viewModel.isVisibleConfirmPassword,
                              validator: confirmPassword,
                              suffixIcon: InkWell(
                                  onTap: ()=> viewModel.visibleConfirmPassword(),
                                  child: Icon(!viewModel.isVisibleConfirmPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            ),
                            VSpace(24.h),
                            Container(
                              width: deviceWidth(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Styles.regular("Already have an account?",
                                      color: black),
                                  HSpace(3.w),
                                  GestureDetector(
                                      onTap: () => Navigator.push(
                                            context,
                                            MainRouter.generateRoute(
                                              const RouteSettings(
                                                  name: RoutePaths.login),
                                            ),
                                          ),
                                      child: Styles.semiBold("Sign in",
                                          color: primaryColor))
                                ],
                              ),
                            ),
                            VSpace(50.h),
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton(
                                  title: "Sign up",
                                  isActive: true,
                                  onPress: () async {
                                    print("sign up");
                                    bool isValid =
                                        _formKey.currentState!.validate();
                                    if (isValid) {
                                      context.loaderOverlay.show();

                                      bool registerSuccess =
                                          await viewModel.register(context,
                                              firstName: _firstNameControl.text,
                                              lastName: _lastControl.text,
                                              email: _emailControl.text,
                                              password: _passwordControl.text);
                                      print(
                                          "Is register success $registerSuccess");
                                      if (registerSuccess) {
                                        context.loaderOverlay.hide();
                                      } else {
                                        context.loaderOverlay.hide();
                                      }
                                    }
                                  }),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
