// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:planetx/modules/auth/view_model/validate_auth_vm.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/space.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/utils/validator.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/loading_overlay.dart';
import 'widgets/textform_field_with_icon.dart';

class ValidateAuth extends StatefulWidget {
  const ValidateAuth({Key? key}) : super(key: key);

  @override
  State<ValidateAuth> createState() => _ValidateAuthState();
}

class _ValidateAuthState extends State<ValidateAuth> with InputValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<ValidateAuthViewModel>(
      vmBuilder: (context) =>
          ValidateAuthViewModel(authService: si.authService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ValidateAuthViewModel model) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const LoadingOverlay(
        image: "sendovia_logo",
        text: "Validating ...",
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
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/login-bg.png",
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
                                Styles.bold("Sign in",
                                    fontSize: 24.sp, color: bunkerDark),
                                Image.asset(
                                  "assets/images/Logo.png",
                                  height: 18.h,
                                  width: 78.w,
                                )
                              ],
                            ),
                            VSpace(200.h),
                            Styles.regular("Email", color: black),
                            VSpace(12.h),
                            TextFormFieldWithIcon(
                              labelText: "Email",
                              controller: _emailControl,
                              validator: validateEmail,
                              // prefixIcon: Icon(Icons.person),
                              // suffixIcon: const Icon(Icons.person),
                            ),
                            VSpace(24.h),
                            // Styles.regular("Password", color: black),
                            // VSpace(12.h),
                            // VSpace(24.h),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Styles.semiBold("Forgot Password?",
                            //       color: activeGreen, fontSize: 14.sp),
                            // ),
                            VSpace(54.h),
                            Container(
                              width: deviceWidth(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Styles.regular("Don't have an account?",
                                      color: black),
                                  HSpace(3.w),
                                  GestureDetector(
                                      onTap: () => Navigator.push(
                                            context,
                                            MainRouter.generateRoute(
                                              const RouteSettings(
                                                  name: RoutePaths.signUp),
                                            ),
                                          ),
                                      child: Styles.semiBold("Sign up",
                                          color: primaryColor))
                                ],
                              ),
                            ),
                            VSpace(30.h),
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton(
                                  title: "Send token",
                                  isActive: true,
                                  onPress: () async {
                                   
                                    bool isValid =
                                        _formKey.currentState!.validate();
                                         print("get token valid $isValid");

                                    if(isValid) {
                                      context.loaderOverlay.show();
                                      // Navigator.push(
                                      //   context,
                                      //   MainRouter.generateRoute(
                                      //     const RouteSettings(name: RoutePaths.login),
                                      //   ),
                                      // );
                                      bool tokenGotten = await model.getToken(
                                          context,
                                          email: _emailControl.text);

                                      if (tokenGotten) {
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
            )),
      ),
    );
  }
}
