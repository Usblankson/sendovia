import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:planetx/modules/auth/widgets/textform_field_with_icon.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/loading_overlay.dart';
import 'package:planetx/shared/widgets/space.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpUser extends StatelessWidget {
  const SignUpUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: LoadingOverlay(
        image: "shopping-bag",
        text: "You’re all set, start sending gifts",
      ),
      overlayOpacity: 0.8,
      child: Scaffold(
        backgroundColor: backGroundGrey,
        body: Container(
            width: deviceWidth(context),
            height: deviceHeight(context),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 24.h),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/signup-bg.png",
                            ),
                            fit: BoxFit.contain)),
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
                              // prefixIcon: Icon(Icons.person),
                              // suffixIcon: Icon(Icons.person),
                              ),
                          VSpace(24.h),
                          Styles.regular("Last Name", color: black),
                          VSpace(12.h),
                          TextFormFieldWithIcon(
                              // prefixIcon: Icon(Icons.person),
                              // suffixIcon: Icon(Icons.person),
                              ),
                          VSpace(24.h),
                          Styles.regular("Email", color: black),
                          VSpace(12.h),
                          TextFormFieldWithIcon(
                              // prefixIcon: Icon(Icons.person),
                              // suffixIcon: Icon(Icons.person),
                              ),
                          VSpace(24.h),
                          Styles.regular("Password", color: black),
                          VSpace(12.h),
                          TextFormFieldWithIcon(
                            // prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                          VSpace(24.h),
                          Styles.regular("Confirm Password", color: black),
                          VSpace(12.h),
                          TextFormFieldWithIcon(
                            // prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility),
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
                                            RouteSettings(name: RoutePaths.login),
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
                                onPress: () {
                                  print("sign up");
                                  context.loaderOverlay.show();
                                  Timer( Duration(seconds: 8),
                                          () => context.loaderOverlay.hide()
                                  );
                                }),
                          ),
                        ]),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
