import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/core/services/product_service.dart';
import 'package:planetx/core/services/profile_services.dart';
import 'package:planetx/core/view_model/base_vm.dart';
import 'package:planetx/modules-new/authentication/view_models/register_view_model.dart';
import 'package:planetx/shared/models/api_model.dart';
import 'package:planetx/shared/models/auth_payload.dart';
import 'package:planetx/shared/models/edit_profile_model.dart';
import 'package:planetx/shared/utils/validator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfileViewModel extends BaseViewModel with InputValidationMixin{

  final ProfileServices profileServices;

  ProfileViewModel({this.profileServices});
  ViewState viewState = ViewState.idle;
  // bool isValidPassword = false;
  String message;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();


  notify(){
    notifyListeners();
  }

  FutureOr<void> init() {
  }

  void setViewState(ViewState value) {
    viewState = value;
    notifyListeners();
  }

  bool editProfileButtonIsEnabled() {
    return  firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        viewState != ViewState.busy;
  }

  String validateProfile() {
    String error = "";
    error = fieldValidate(firstNameController.text.trim());
    error += "\n" +
        fieldValidate(lastNameController.text.trim());
    error += "\n" +
        fieldValidate(phoneNumberController.text.trim());

    return error.trim();
  }

  Future<bool> editProfile(BuildContext context) async {
    // changeStatus();

    String error = validateProfile();
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
    final ApiResponse<EditProfileModel> res =
    await si.profileServices.editProfile(firstName: firstNameController.text, lastName: lastNameController.text, phoneNumber: phoneNumberController.text);
    debugPrint("edit prof ${res.message}");
    debugPrint("edit prof ${res.data}");

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
      await si.authService.getAuthData();
      Navigator.pop(context);

      return res.success;
    }
  }


  resetControllers() {
    firstNameController.text = "";
    lastNameController.text = "";
    phoneNumberController.text = "";
  }

}