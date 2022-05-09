import 'dart:async';

import '../../../core/services/auth_service.dart';
import '../../../core/view_model/base_vm.dart';

class ValidateAuthViewModel extends BaseViewModel {
  final AuthService? authService;

  ValidateAuthViewModel({this.authService});

  @override
  FutureOr<void> init() {
    isLoading = false;
  }
}