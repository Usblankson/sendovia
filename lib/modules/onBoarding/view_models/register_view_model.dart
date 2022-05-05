import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/src/overlay_controller_widget_extension.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/core/services/auth_service.dart';
import 'package:planetx/core/view_model/base_vm.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/models/api_model.dart';
import 'package:planetx/shared/models/register_payload.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterViewModel extends BaseViewModel {
  final AuthService? authService;
  RegisterViewModel({this.authService});
  String? message;
  bool error = false;
  bool isValidEmail = false;
  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;

  @override
  FutureOr<void> init() {
    // TODO: implement init
  }

  validateEmail(value) {
    isValidEmail = value;
    notifyListeners();
  }

  visiblePassword() {
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
  }

  visibleConfirmPassword() {
    isVisibleConfirmPassword = !isVisibleConfirmPassword;
    notifyListeners();
  }

  Future<bool> register(
      BuildContext context,
      {String? firstName,
        String? lastName,
        String? email,
        String? password,
        }) async {
    changeStatus();
    final ApiResponse<RegisterPayload> res = await si.authService!
        .signUp(firstName: firstName, lastName: lastName, email: email, password: password);
    debugPrint("res ${res.message}");

    print("yess----: " + res.data.toString());
    print("yess----1: " + res.message.toString());
    print("yess----2: " + res.success.toString());

    if (res.success == false) {
      isLoading = res.success;
      message = res.message!;
      // debugPrint("res err mess ${res.message}");
      showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: res.message!,
          ));
      return res.success;
    } else {
      message = res.message!;
      /// if needed cache user data locally here
      // si.storageService.setItem('register_data', json.encode(res.data));
      // debugPrint("res mess ${res.message}");
      showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: res.message!,
          ));
      isLoading = false;
      Navigator.push(
        context,
        MainRouter.generateRoute(
          const RouteSettings(name: RoutePaths.validateAuth),
        ),
      );
      return res.success;
    }
  }
}
