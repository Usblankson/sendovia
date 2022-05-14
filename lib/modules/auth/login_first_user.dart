import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:planetx/modules/auth/view_model/auth_vm.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/space.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/loading_overlay.dart';
import 'widgets/textform_field_with_icon.dart';

class LoginFirstUser extends StatefulWidget {
  const LoginFirstUser({Key? key}) : super(key: key);

  @override
  _LoginFirstUserState createState() => _LoginFirstUserState();
}

class _LoginFirstUserState extends State<LoginFirstUser> {

  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _token = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      vmBuilder: (context) =>
          AuthViewModel(authService: si.authService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, AuthViewModel model) {
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: deviceWidth(context), maxHeight: deviceHeight(context)),
    //     designSize: Size(375, 812),
    //     orientation: Orientation.portrait);
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const LoadingOverlay(
        image: "sendovia_logo",
        text: "Authenticating ...",
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
                      key: _form,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Styles.bold("Login",
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
                              // prefixIcon: Icon(Icons.person),
                              suffixIcon: Icon(Icons.person),
                              controller: _email,
                            ),
                            VSpace(24.h),
                            Styles.regular("Token", color: black),
                            VSpace(12.h),
                            TextFormFieldWithIcon(
                              suffixIcon: Icon(Icons.visibility),
                              controller: _token,
                            ),
                            VSpace(40.h),
                            CustomButton(
                                title: "Log in",
                                isActive: true,
                                onPress: () async {
                                  print("Login In");
                                  bool isValid = _form.currentState!.validate();
                                  if(isValid) {
                                    context.loaderOverlay.show();
                                    bool logged = await model.login(context, email: _email.text, token: _token.text);
                                    if (logged) {
                                      context.loaderOverlay.hide();
                                    } else {
                                      context.loaderOverlay.hide();
                                    }
                                  }
                                  // Navigator.push(
                                  //   context,
                                  //   MainRouter.generateRoute(
                                  //     const RouteSettings(
                                  //         name: RoutePaths.bottomNav),
                                  //   ),
                                  // );
                                }),
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
