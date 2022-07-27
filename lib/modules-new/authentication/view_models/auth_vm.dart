import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/shared/models/auth_payload.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/utils/validator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/service_injector/service_injector.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/view_model/base_vm.dart';
import '../../../router/main_router.dart';
import '../../../router/route_paths.dart';
import '../../../shared/models/api_model.dart';
import '../../bottom_tabbar.dart';

class AuthViewModel extends BaseViewModel with InputValidationMixin{
  final AuthService authService;

  AuthViewModel({this.authService});
  bool isValidEmail = false;
  String message;
  bool isVisiblePassword = true;
  ViewState viewState = ViewState.idle;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  FutureOr<void> init() {
    // isLoading = false;
  }

  // validateEmail(value) {
  //   isValidEmail = value;
  //   notifyListeners();
  // }

  visiblePassword() {
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
  }


  void setViewState(ViewState value) {
    viewState = value;
    notifyListeners();
  }

  bool loginButtonIsEnabled() {
    return  emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        viewState != ViewState.busy;
  }

  String validateLogin() {
    String error = "";
    error = validateEmail(emailController.text.trim());
    // error += "\n" +
    //     validatePassword(passwordController.text.trim());

    return error.trim();
  }

  Future<bool> login(BuildContext context) async {
    // changeStatus();

    String error = validateLogin();
    if (error.isNotEmpty) {
      message = error;
      showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: message,
          ));
      return false;
    }

    setViewState(ViewState.busy);
    final ApiResponse<AuthPayload> res =
        await si.authService.login(emailController.text, '12345');
    // debugPrint("res first ${res.message}");

    print("yess----: " + res.data.toString());
    print("yess----1: " + res.message.toString());
    print("yess----2: " + res.success.toString());

    if (res.success == false) {
      isLoading = res.success;
      message = res.message ?? "Error occured";
      // debugPrint("res err mess ${res.message}");
      showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: message,
          ));
      setViewState(ViewState.error);
      return res.success;
    } else {
      message = "Success!";
      debugPrint("res mess1 ${res.token.toString()}");
      debugPrint("res mess11 ${res.data.toString()}");

      si.storageService.setItem('auth_data', json.encode(res.data.toJson()));
      si.storageService.setItem('token', json.encode(res.token));
      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
      si.storageService.setItem('loginTime', dateFormat.format(DateTime.now()));

      // Map<String, dynamic> decodedToken = JwtDecoder.decode(res.data!.data);
      // bool tokenTime = JwtDecoder.isExpired(res.payload.accessToken);
      // si.storageService.setItem('token_data', json.encode(decodedToken));

      /// if needed cache user data locally here
      // si.storageService.setItem('auth_data', json.encode(res.data!.data));

      resetControllers();
      setViewState(ViewState.retrieved);

      showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: message,
          ));
      // isLoading = false;
      // Navigator.push(
      //   context,
      //   MainRouter.generateRoute(
      //     const RouteSettings(name: RoutePaths.bottomNav),
      //   ),
      // );
      Nav.forwardNoReturn(context, TabLayout());
      return res.success;
    }
  }

  resetControllers() {
    emailController.text = "";
    passwordController.text = "";
  }

}
