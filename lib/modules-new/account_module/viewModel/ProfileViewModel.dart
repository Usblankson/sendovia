import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:planetx/core/services/product_service.dart';
import 'package:planetx/core/view_model/base_vm.dart';

class ProfileViewModel extends BaseViewModel {
  final ProductService productService;
  final BuildContext context;

  ProfileViewModel(this.productService, this.context);


  @override
  FutureOr<void> init() {

  }

}