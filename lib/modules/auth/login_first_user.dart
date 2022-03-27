import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/space.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/textform_field_with_icon.dart';

class LoginFirstUser extends StatefulWidget {
  const LoginFirstUser({Key key}) : super(key: key);

  @override
  _LoginFirstUserState createState() => _LoginFirstUserState();
}

class _LoginFirstUserState extends State<LoginFirstUser> {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: deviceWidth(context), maxHeight: deviceHeight(context)),
    //     designSize: Size(375, 812),
    //     orientation: Orientation.portrait);
    return Scaffold(
      backgroundColor: backGroundGrey,
      body: Container(
          width: deviceWidth(context),
          height: deviceHeight(context),

          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 24.h),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/login-bg.png",),fit: BoxFit.contain)
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Styles.bold("Sign in", fontSize: 24.sp, color: bunkerDark),
                            Image.asset("assets/images/Logo.png", height: 18.h, width: 78.w,)

                          ],
                        ),
                        VSpace(200.h),
                        Styles.regular("Email", color: black),
                        VSpace(12.h),
                        TextFormFieldWithIcon(
                          // prefixIcon: Icon(Icons.person),
                          suffixIcon: Icon(Icons.person),
                        ),
                        VSpace(24.h),
                        Styles.regular("Password", color: black),
                        VSpace(12.h),
                        TextFormFieldWithIcon(
                          // prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility),
                        ),
                        // VSpace(24.h),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: Styles.semiBold("Forgot Password?",
                        //       color: activeGreen, fontSize: 14.sp),
                        // ),
                        VSpace(24.h),
                        Container(
                          width: deviceWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Styles.regular("Don't have an account?", color: black),
                              HSpace(3.w),
                              GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MainRouter.generateRoute(
                                      RouteSettings(name: RoutePaths.signUp),
                                    ),
                                  ),
                                  child: Styles.semiBold("Sign up", color: primaryColor))
                            ],
                          ),
                        ),
                        VSpace(180.h),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                              title: "Log in",
                              isActive: true,
                              onPress: () {
                                print("Login In");
                              }),
                        ),
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
