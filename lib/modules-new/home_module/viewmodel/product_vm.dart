// ignore_for_file: unused_import

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetx/core/services/product_service.dart';
import 'package:planetx/shared/models/allProducts_payload.dart';
import 'package:planetx/shared/models/auth_payload.dart';
import 'package:planetx/shared/models/cart_model.dart';
import 'package:planetx/shared/models/categories_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../core/service_injector/service_injector.dart';
import '../../../core/services/cart_service.dart';
import '../../../core/view_model/base_vm.dart';
import '../../../shared/models/api_model.dart';

class ProductViewModel extends BaseViewModel {
  final ProductService productService;
  // final CartService
  final BuildContext context;
  ProductViewModel({this.productService, this.context});

  notify() {
    notifyListeners();
  }

  String message = "";
  bool cartSelected = false;
  List<PayloadFromProducts> allProducts = [];
  List<PayloadFromProducts> sortProducts = [];
  List<PayloadFromCategories> allCategories = [];
  String dropdownValue = 'Budget';
  String categories = 'Category';
  AuthPayload authPayload;
  List<int> quantityToPurchase = [];
  TextEditingController searchController = TextEditingController();


  List<PayloadFromProducts> get sortAllProducts {
    sortProducts = allProducts;
    List<PayloadFromProducts> newList = [];
    List<PayloadFromProducts> returnList = [];
      sortProducts.sort(
      (a,b) {
        // debugPrint("see sort ${a.name.compareTo(b.name)}");
        if(a.name.toLowerCase().compareTo(b.name.toLowerCase()) < 0) {
          newList.add(a);
        } else if(a.name.toLowerCase().compareTo(b.name.toLowerCase()) == 0) {
          newList.add(a);
        }
        else {
          newList.add(a);
        }
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      }
      );

      newList.forEach((element) {
        if(element.name.toLowerCase().contains(searchController.text) || element.description.toLowerCase().contains(searchController.text.toLowerCase()))
          {
            returnList.add(element);
            // debugPrint("see sort ${element.name}");
          }
      });
        debugPrint("prince print");
    return returnList;
  }


  @override
  FutureOr<void> init() async {
    // ignore: todo
    // TODO: implement init
    getProducts(
      context: context,
    );
    getCategories(
      context: context,
    );
    authPayload = await si.authService.getAuthData();
  }

  checkCart(bool value) {
    cartSelected = value;
    notify();
  }

  Future<void> getProducts({BuildContext context}) async {
    changeStatus();

    final ApiResponse<AllProductsPayload> res =
        await si.productService.getAllProducts();

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

      allProducts = res.data.data;
      // sortAllProducts = allProducts;
      print("payload from products" + allProducts.toString());
      quantityToPurchase = List.filled(allProducts.length, 1);
      // showTopSnackBar(
      //   context,
      //   CustomSnackBar.success(
      //     message: message,
      //   ),
      // );
      changeStatus();
    }
    changeStatus();
  }

  Future<void> getCategories({BuildContext context}) async {
    changeStatus();

    final ApiResponse<CategoriesPayload> res =
        await si.productService.getAllCategories();

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

      allCategories = res.data.data;
      print("payload from categories" + allCategories.toString());
      // showTopSnackBar(
      //   context,
      //   CustomSnackBar.success(
      //     message: message,
      //   ),
      // );
      changeStatus();
    }
    changeStatus();
  }

  // Future<void> getProductItem({BuildContext? context, productID}) async {
  //   changeStatus();
  //
  //   final ApiResponse<ProductItemPayload> res =
  //       await si.cartService.getProductItem(productID);
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
  //     // print("job range success" + jobRange);
  //     // print("payload content" + res.payload.payload.toString());
  //
  //     productInfo = res.data!.data!;
  //
  //     showTopSnackBar(
  //       context!,
  //       CustomSnackBar.success(
  //         message: message,
  //       ),
  //     );
  //     changeStatus();
  //     changeStatus();
  //   }
  // }
}
