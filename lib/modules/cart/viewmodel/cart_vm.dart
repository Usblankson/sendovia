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
import '../../../shared/models/update_cart_payload.dart';

class CartViewModel extends BaseViewModel {
  final CartService? cartService;
  final BuildContext? context;
  CartViewModel({this.cartService, this.context});

  notify() {
    notifyListeners();
  }

  String message = "";
  double total = 0;
  bool cartSelected = false;
  List<String> selectedCartId = [];
  List<PayloadFromCart> userCartInfo = [];

  @override
  FutureOr<void> init() async {
    // ignore: todo
    // TODO: implement init
    getCart(
      context: context!,
    );
  }

  Future<void> refreshContent() async {
    getCart(
      context: context!,
    );
  }

  checkCart(id, price) {
    // cartSelected = value;
    if (!selectedCartId.contains(id)) {
      selectedCartId.add(id);
      total += price!;
    } else {
      selectedCartId.remove(id);
      total -= price!;
    }
    notify();
  }

  selectCart(id) {
    if (switchAll == true) {
      if (!selectedCartId.contains(id)) {
        selectedCartId.add(id);
      }
    } else {
      if (selectedCartId.contains(id)) {
        selectedCartId.remove(id);
      }
    }
    notify();
  }

  deselectCart(id) {
    if (selectedCartId.contains(id)) {
      selectedCartId.remove(id);
    }
    notify();
  }

  bool switchAll = false;
  switchCart() {
    switchAll = !switchAll;

    selectedAll;


    notify();
  }

  removeFromCartID() {
    selectedCartId.forEach((element) {
      removeFromCart(context: context, cartId: element);
      total = 0.0;
    });
    notify();
  }

  selectedAll() {
    userCartInfo.forEach((element) {
      selectCart(element.id);
      total += element.price!;
    });

    notify();
  }

  // getTotal() {
  //   userCartInfo.forEach((element) {
  //     total += element.price!;
  //   });
  // }

  Future<void> getCart({BuildContext? context}) async {
    changeStatus();

    final ApiResponse<CartPayload> res = await si.cartService.getCart();

    if (!res.success) {
      isLoading = !res.success;
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.error(
          message: message,
        ),
      );
      changeStatus();
    } else {
      message = res.message!;
      // print("job range success" + jobRange);
      // print("payload content" + res.payload.payload.toString());

      userCartInfo = res.data!.data!;
      // getTotal();
      showTopSnackBar(
        context!,
        CustomSnackBar.success(
          message: message,
        ),
      );
      changeStatus();
      changeStatus();
    }
  }

  Future<void> updateCart(
      {BuildContext? context,
      required int quantity,
      required String productId}) async {
    changeStatus();

    final ApiResponse<UpdateCartPayload> res =
        await si.cartService.updateCart(quantity, productId);

    if (!res.success) {
      isLoading = !res.success;
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.error(
          message: message,
        ),
      );
      changeStatus();
    } else {
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.success(
          message: message,
        ),
      );
      refreshContent();
      changeStatus();
    }
  }

  Future<void> removeFromCart(
      {BuildContext? context, required String cartId}) async {
    changeStatus();

    final ApiResponse<UpdateCartPayload> res =
        await si.cartService.removeFromCart(cartId);

    if (!res.success) {
      isLoading = !res.success;
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.error(
          message: message,
        ),
      );
      changeStatus();
    } else {
      message = res.message!;

      showTopSnackBar(
        context!,
        CustomSnackBar.success(
          message: message,
        ),
      );
      changeStatus();
    }
  }

  // Future<void> addToCart(
  //     {BuildContext? context, required String cartId}) async {
  //   changeStatus();
  //
  //   final ApiResponse<UpdateCartPayload> res =
  //       await si.cartService.removeFromCart(cartId);
  //
  //   if (!res.success) {
  //     isLoading = !res.success;
  //     message = res.message!;
  //
  //     showTopSnackBar(
  //       context!,
  //       CustomSnackBar.error(
  //         message: message,
  //       ),
  //     );
  //     changeStatus();
  //   } else {
  //     message = res.message!;
  //
  //     showTopSnackBar(
  //       context!,
  //       CustomSnackBar.success(
  //         message: message,
  //       ),
  //     );
  //     changeStatus();
  //   }
  // }
}
