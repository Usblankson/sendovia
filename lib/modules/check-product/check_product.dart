// ignore_for_file: unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules/check-product/viewmodel/diplay_product_vm.dart';
// import 'package:get/get.dart';
import 'package:planetx/shared/models/themes.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/widgets/button.dart';
import 'package:planetx/shared/widgets/custom_button.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/widgets/base_view.dart';
// import '../cart/viewmodel/cart_vm.dart';

class CheckProductScreen extends StatelessWidget {
  String productID;
  CheckProductScreen({Key? key, required this.productID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DisplayProducViewModel>(
      vmBuilder: (context) => DisplayProducViewModel(
          context: context, cartService: si.cartService, productId: productID),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, DisplayProducViewModel viewModel) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 10.h,
          ),
          child: viewModel.productInfo == null
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 290.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              viewModel.productInfo!.image!,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Styles.semiBold(
                                viewModel.productInfo?.category?.name ??
                                    "Airpods",
                                fontSize: 16.sp,
                                height: 3,
                                color: black,
                              ),
                              SizedBox(height: 9),
                              Styles.bold(
                                viewModel.productInfo?.name ??
                                    "Airpods Pro Max",
                                fontSize: 17.sp,
                                height: 2.h,
                                color: Color(0xff4F4F4F),
                              ),
                              SizedBox(height: 9.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Styles.regular(
                                    viewModel.productInfo?.description ??
                                        "New AirPods Expected Later This \nYear as Suppliers Begin \nComponent ..",
                                    fontSize: 13.sp,
                                    color: black,
                                  ),
                                  Styles.regular(
                                    "\$ ${viewModel.productInfo?.price.toString() ?? "00"}",
                                    fontSize: 20.sp,
                                    color: Color(0xff4F4F4F),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Styles.bold(
                                        "Colors",
                                        fontSize: 16.sp,
                                        color: Color(0xff4F4F4F),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     //   SizedBox(width: 40),
                                  //     Container(
                                  //       child: Center(
                                  //         child: Row(
                                  //           children: [
                                  //             Image.asset("assets/images/white.png",
                                  //                 height: 35),
                                  //             Styles.regular(
                                  //               "White",
                                  //               fontSize: 14.sp,
                                  //               color: Color(0xff4F4F4F),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       height: 40.h,
                                  //       width: 125.w,
                                  //       decoration: BoxDecoration(
                                  //           borderRadius: BorderRadius.circular(30),
                                  //           border: Border.all(
                                  //               color: Color(0xff0B72D2),
                                  //               width: 0.5)),
                                  //     ),
                                  //     SizedBox(width: 30),
                                  //     Image.asset("assets/images/black.png",
                                  //         height: 35),
                                  //     Styles.regular(
                                  //       "Black",
                                  //       fontSize: 14.sp,
                                  //       color: Color(0xff4F4F4F),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Styles.semiBold(
                                    "Quantity",
                                    fontSize: 16.sp,
                                    color: black,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 40.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: grey.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              if (viewModel
                                                      .quantityToPurchase! <
                                                  viewModel
                                                      .productInfo!.stock!) {
                                                viewModel.quantityToPurchase =
                                                    viewModel
                                                            .quantityToPurchase! +
                                                        1;
                                                viewModel.notify();
                                              }
                                            }),
                                      ),
                                      SizedBox(width: 20.w),
                                      Styles.regular(
                                        "${viewModel.quantityToPurchase}",
                                        fontSize: 25.sp,
                                        color: black,
                                      ),
                                      SizedBox(width: 20.w),
                                      Container(
                                        height: 40.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: grey.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              if (viewModel
                                                      .quantityToPurchase! >
                                                  1) {
                                                viewModel.quantityToPurchase =
                                                    viewModel
                                                            .quantityToPurchase! -
                                                        1;
                                                viewModel.notify();
                                              }
                                            }),
                                      ),

                                      // Container(
                                      //   height: 40.h,
                                      //   width: 40.w,
                                      //   decoration: BoxDecoration(
                                      //       color: grey.withOpacity(0.2),
                                      //       borderRadius:
                                      //           BorderRadius.circular(10)),
                                      //   child: Icon(Icons.add),
                                      // ),
                                      // SizedBox(width: 20.w),
                                      // Styles.semiBold(
                                      //   "1",
                                      //   fontSize: 25.sp,
                                      //   color: black,
                                      // ),
                                      // SizedBox(width: 20.w),
                                      // Container(
                                      //   height: 40.h,
                                      //   width: 40.w,
                                      //   decoration: BoxDecoration(
                                      //       color: grey.withOpacity(0.2),
                                      //       borderRadius:
                                      //           BorderRadius.circular(10)),
                                      //   child: Icon(Icons.remove),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 250.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.addToCart(
                                          context: context,
                                          cartId: productID,
                                          quantity:
                                              viewModel.quantityToPurchase);
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Styles.bold(
                                          "Add to Cart",
                                          fontSize: 18.sp,
                                          color: Color(0xff7B61FF),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: grey, width: 1)),
                                      height: 55.h,
                                      width: 180.w,
                                    ),
                                  ),
                                  Container(
                                    height: 55.h,
                                    width: 180.w,
                                    child: Center(
                                      child: Styles.bold(
                                        "Send gift",
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xff7B61FF),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
