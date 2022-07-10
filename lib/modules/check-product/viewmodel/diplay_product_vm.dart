import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetx/shared/models/cart_model.dart';
import 'package:planetx/shared/models/product_item.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../core/service_injector/service_injector.dart';
import '../../../core/services/cart_service.dart';
import '../../../core/view_model/base_vm.dart';
import '../../../shared/models/api_model.dart';
import '../../../shared/models/update_cart_payload.dart';

class DisplayProducViewModel extends BaseViewModel {
  final CartService cartService;
  final BuildContext context;
  final String productId;
  DisplayProducViewModel({this.cartService, this.context, this.productId});

  notify() {
    notifyListeners();
  }

  String message = "";
  bool cartSelected = false;
  int quantityToPurchase = 1;
  PayloadFromPI productInfo;
  List<PayloadFromCart> userCartInfo = [];

  @override
  FutureOr<void> init() async {
    // ignore: todo
    // TODO: implement init

    getProductItem(context: context, productID: productId);
  }

  Future<void> getProductItem({BuildContext context, productID}) async {
    changeStatus();

    final ApiResponse<ProductItemPayload> res =
        await si.cartService.getProductItem(productID);

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

      productInfo = res.data.data;

      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: message,
        ),
      );
      changeStatus();
      changeStatus();
    }
  }

  Future<void> addToCart(
      {BuildContext context,
        String cartId,
      int quantity = 1}) async {
    changeStatus();

    final ApiResponse<UpdateCartPayload> res =
        await si.cartService.addToCart(cartId, quantity);

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

      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: message,
        ),
      );
      changeStatus();
    }
  }
}
