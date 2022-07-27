import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/core/services/auth_service.dart';
import 'package:planetx/core/view_model/base_vm.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/models/api_model.dart';
import 'package:planetx/shared/models/register_payload.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../shared/utils/validator.dart';
import '../enter_otp.dart';

class RegisterViewModel extends BaseViewModel with InputValidationMixin {
  final AuthService authService;
  RegisterViewModel({this.authService});
  String message;
  bool error = false;
  bool isValidEmail = false;
  bool isVisiblePassword = true;
  bool isVisibleConfirmPassword = true;
  ViewState viewState = ViewState.idle;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  FutureOr<void> init() {
    // TODO: implement init
  }

  // validateEmail(value) {
  //   isValidEmail = value;
  //   notifyListeners();
  // }

  visiblePassword() {
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
  }

  visibleConfirmPassword() {
    isVisibleConfirmPassword = !isVisibleConfirmPassword;
    notifyListeners();
  }

  void setViewState(ViewState value) {
    viewState = value;
    notifyListeners();
  }

  bool signupButtonIsEnabled() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        // hasAcceptedTerms &&
        viewState != ViewState.busy;
  }

  String validateSignup() {
    String error = "";

    error = fieldValidate(firstNameController.text.trim());
    error += "\n" + fieldValidate(firstNameController.text.trim());
    error +=
        "\n" + validateEmail(emailController.text.trim());
    error += "\n" +
        validatePassword(passwordController.text.trim());

    return error.trim();
  }

  Future<bool> register(
      BuildContext context,
      ) async {
    // changeStatus();

    // {String firstName,
    //     String lastName,
    // String email,
    // String password,
    // }

    String error = validateSignup();
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
    try {
      debugPrint("before res");

      ApiResponse<RegisterPayload> res = await si.authService
            .signUp(firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            password: passwordController.text);

        // print("yess----: " + res.data.toString());
        // print("yess----1: " + res.message.toString());
        // print("yess----2: " + res.success.toString());

        if (res.success == false) {
          // isLoading = res.success;
          message = res.message;
          // debugPrint("res err mess ${res.message}");
          setViewState(ViewState.error);
          showTopSnackBar(
              context,
              CustomSnackBar.error(
                message: res.message,
              ));
          return res.success;
        } else {
          message = res.message;

          /// if needed cache user data locally here
          // si.storageService.setItem('register_data', json.encode(res.data));
          // debugPrint("res mess ${res.message}");
          setViewState(ViewState.retrieved);
          resetControllers();

          showTopSnackBar(
              context,
              CustomSnackBar.success(
                message: res.message,
              ));
          isLoading = false;
          // Navigator.push(
          //   context,
          //   MainRouter.generateRoute(
          //     const RouteSettings(name: RoutePaths.validateAuth),
          //   ),
          // );

          Nav.forward(context, EnterCode());
          return res.success;
        }
    } catch (e) {
      setViewState(ViewState.error);
      showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: e.toString(),
          ));
    }
  }

  resetControllers() {
    firstNameController.text = "";
    lastNameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    phoneNumberController.text = "";
  }

}


enum ViewState { idle, retrieved, error, busy }