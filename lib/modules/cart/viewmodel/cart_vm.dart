import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetx/shared/models/cart_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../core/service_injector/service_injector.dart';
import '../../../core/services/cart_service.dart';
import '../../../core/view_model/base_vm.dart';
import '../../../shared/models/api_model.dart';

class CartViewModel extends BaseViewModel {
  final CartService cartService;
  final BuildContext context;
  CartViewModel({this.cartService, this.context});

  notify() {
    notifyListeners();
  }

  String message = "";
  bool cartSelected = false;

  @override
  FutureOr<void> init() async {
    // ignore: todo
    // TODO: implement init
  }

  checkCart(bool value) {
    cartSelected = value;
    notify();
  }

  Future<void> getContent(
      {BuildContext context, String pageIndex, String jobRange}) async {
    changeStatus();

    final ApiResponse<CartPayload> res = await si.cartService
        .getHistory(pageIndex: pageIndex, jobRange: jobRange);

    if (!res.success) {
      isLoading = !res.success;
      message = res.message;

      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: message,
        ),
      );
      changeStatus();
    } else {
      message = res.message;
      // print("job range success" + jobRange);
      // print("payload content" + res.payload.payload.toString());

      if (jobRange == "3") {
        historyContent = res.payload.payload;
      }
      if (jobRange == "2") todaysTaskContent = res.payload.payload;

      // showTopSnackBar(
      //   context,
      //   CustomSnackBar.success(
      //     message: message,
      //   ),
      // );
      changeStatus();
    }
  }
}
