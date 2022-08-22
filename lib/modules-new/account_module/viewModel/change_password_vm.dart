import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/core/view_model/base_vm.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/models/api_model.dart';
import 'package:planetx/shared/models/change_password_model.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/utils/validator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/services/auth_service.dart';

class ChangePasswordViewModel extends BaseViewModel with InputValidationMixin {

  final AuthService authService;

  ChangePasswordViewModel({this.authService});
  ViewState viewState = ViewState.idle;
  bool isValidPassword = false;
  String message;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  notify(){
    notifyListeners();
  }

  FutureOr<void> init() {
  }

  void setViewState(ViewState value) {
    viewState = value;
    notifyListeners();
  }

  bool changePasswordButtonIsEnabled() {
    return  oldPasswordController.text.isNotEmpty &&
         newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        viewState != ViewState.busy;
  }

  String validateChange() {
    String error = "";
    error = commonPassword(oldPasswordController.text.trim());
    error += "\n" +
        validatePassword(newPasswordController.text.trim());
 error += "\n" +
     confirmPassword(confirmPasswordController.text.trim());

    return error.trim();
  }

  Future<bool> changePassword(BuildContext context) async {
    // changeStatus();

    String error = validateChange();
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
    final ApiResponse<ChangePasswordModel> res =
    await si.profileServices.changePassword(newPassword: newPasswordController.text, oldPassword: oldPasswordController.text);
    debugPrint("change password ${res.message}");
    debugPrint("change password ${res.data}");

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
      message = res.message ?? "Success!";
      resetControllers();
      setViewState(ViewState.retrieved);

      showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: message,
          ));
      // isLoading = false;
      Navigator.pop(context);

      return res.success;
    }
  }


  resetControllers() {
    oldPasswordController.text = "";
    newPasswordController.text = "";
    confirmPasswordController.text = "";
  }


}