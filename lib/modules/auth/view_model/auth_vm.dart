import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planetx/shared/models/auth_payload.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/service_injector/service_injector.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/view_model/base_vm.dart';
import '../../../router/main_router.dart';
import '../../../router/route_paths.dart';
import '../../../shared/models/api_model.dart';

class AuthViewModel extends BaseViewModel {
  final AuthService authService;

  AuthViewModel({this.authService});
  bool isValidEmail = false;
  String message;

  @override
  FutureOr<void> init() {
    isLoading = false;
  }

  validateEmail(value) {
    isValidEmail = value;
    notifyListeners();
  }

  Future<bool> login(BuildContext context,
      {String email, String token}) async {
    // changeStatus();
    final ApiResponse<AuthPayload> res =
        await si.authService.login(email.trim(), token);
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

      showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: message,
          ));
      isLoading = false;
      Navigator.push(
        context,
        MainRouter.generateRoute(
          const RouteSettings(name: RoutePaths.bottomNav),
        ),
      );
      return res.success;
    }
  }
}
