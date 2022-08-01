import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planetx/core/services/auth_service.dart';
import 'package:planetx/core/view_model/base_vm.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/shared/utils/validator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/service_injector/service_injector.dart';
import '../../../shared/models/api_model.dart';
import '../../../shared/models/auth_payload.dart';
import '../../../shared/utils/navigation.dart';
import '../enter_otp.dart';

class ForgotPasswordViewModel extends BaseViewModel with InputValidationMixin {
  final AuthService authService;

  ForgotPasswordViewModel({this.authService});
  ViewState viewState = ViewState.idle;
  bool isValidEmail = false;
  String message;
  final TextEditingController emailController = TextEditingController();

  FutureOr<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
  void setViewState(ViewState value) {
    viewState = value;
    notifyListeners();
  }

  bool forgotPasswordButtonIsEnabled() {
    return  emailController.text.isNotEmpty &&
        viewState != ViewState.busy;
  }

  String validateForgot() {
    String error = "";
    error = validateEmail(emailController.text.trim());
    // error += "\n" +
    //     validatePassword(passwordController.text.trim());

    return error.trim();
  }

  Future<bool> forgot(BuildContext context) async {
    // changeStatus();

    String error = validateForgot();
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
    await si.authService.forgot(emailController.text);
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
      Nav.forward(context, const EnterCode());
      return res.success;
    }
  }


  resetControllers() {
    emailController.text = "";
  }

}