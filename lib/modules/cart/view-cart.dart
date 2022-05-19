// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules/cart/viewmodel/cart_vm.dart';
import 'package:planetx/modules/check-product/check_product.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/widgets/base_view.dart';
import '../send_gift/add_message_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CartViewModel>(
      vmBuilder: (context) =>
          CartViewModel(context: context, cartService: si.cartService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, CartViewModel viewModel) {
    dynamic selected = true;
    dynamic unselected = false;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: viewModel.refreshContent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => Navigator.push(
                                    context,
                                    MainRouter.generateRoute(
                                      RouteSettings(
                                          name: RoutePaths.storeProductScreen),
                                    ),
                                  ),
                              icon: Icon(Icons.arrow_back)),
                          Styles.bold(
                            "Cart (${viewModel.userCartInfo.length})",
                            fontSize: 16.sp,
                            color: black,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: black,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () {
                                viewModel.removeFromCartID();
                              },
                              icon: Icon(
                                Icons.delete,
                                color: black,
                                size: 30,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  // height: 591.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: viewModel.userCartInfo.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 1.1),
                            borderRadius: BorderRadius.circular(10),
                            color: white),
                        // height: 220.h,
                        // width: 343.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 24.h, horizontal: 10.w),
                        child: Row(
                          children: [
                            Checkbox(
                              tristate: true,
                              shape: CircleBorder(),
                              activeColor: secondaryBlue,
                              onChanged: (value) {
                                viewModel.checkCart(
                                    viewModel.userCartInfo[index].id!,
                                    viewModel.userCartInfo[index].price);
                              },
                              value: viewModel.selectedCartId.contains(
                                      viewModel.userCartInfo[index].id)
                                  ? true
                                  : false,
                            ),
                            // HSpace(1.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                      child: Image.asset(
                                          "assets/images/cart-texticon.png"),
                                    ),
                                    SizedBox(width: 10.w),
                                    Styles.regular(
                                      viewModel.userCartInfo[index].product!
                                              .name ??
                                          "Toptek Stores",
                                      fontSize: 16.sp,
                                      color: black,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 76.h,
                                      width: 85.w,
                                      decoration: BoxDecoration(
                                        color: grey.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: viewModel.userCartInfo[index]
                                                  .product!.image !=
                                              null
                                          ? Image.network(
                                              viewModel.userCartInfo[index]
                                                  .product!.image!,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.asset(
                                              "assets/images/store-product.png",
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    HSpace(15.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Styles.regular(
                                          viewModel.userCartInfo[index].product!
                                                  .description ??
                                              "New AirPods Expected Later This \nYear as Suppliers Begin \nComponent ..",
                                          fontSize: 10.5.sp,
                                          height: 2,
                                          color: black,
                                        ),
                                        VSpace(4.h),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CheckProductScreen(
                                                          productID: viewModel
                                                              .userCartInfo![
                                                                  index]
                                                              .id!)),
                                            );
                                          },
                                          child: Styles.regular(
                                            viewModel.userCartInfo[index]
                                                    .product!.name ??
                                                "Toptek Stores",
                                            fontSize: 8.sp,
                                            height: 2,
                                            color: greyworm,
                                            underline: true,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 20.h,
                                              child: Styles.regular(
                                                viewModel
                                                        .userCartInfo.isNotEmpty
                                                    ? "\$${viewModel.userCartInfo[index].price}"
                                                    : "0",
                                                fontSize: 14.sp,
                                                color: black,
                                              ),
                                            ),
                                            SizedBox(width: 30.w),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 28.h,
                                                  width: 28.w,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          grey.withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r)),
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 12.sp,
                                                      ),
                                                      onPressed: () {
                                                        if (viewModel
                                                                .userCartInfo[
                                                                    index]
                                                                .quantity! <
                                                            viewModel
                                                                .userCartInfo[
                                                                    index]
                                                                .product!
                                                                .stock!) {
                                                          viewModel.updateCart(
                                                              context: context,
                                                              productId: viewModel
                                                                  .userCartInfo[
                                                                      index]
                                                                  .product!
                                                                  .id!,
                                                              quantity: viewModel
                                                                      .userCartInfo[
                                                                          index]
                                                                      .quantity! +
                                                                  1);
                                                        }
                                                      }),
                                                ),
                                                SizedBox(width: 12.w),
                                                Styles.regular(
                                                  viewModel.userCartInfo
                                                          .isNotEmpty
                                                      ? "${viewModel.userCartInfo[index].quantity}"
                                                      : "0",
                                                  fontSize: 15.sp,
                                                  color: black,
                                                ),
                                                SizedBox(width: 12.w),
                                                Container(
                                                  height: 28.h,
                                                  width: 28.w,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          grey.withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r)),
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.remove,
                                                        size: 12.sp,
                                                      ),
                                                      onPressed: () {
                                                        if (viewModel
                                                                .userCartInfo[
                                                                    index]
                                                                .quantity! >
                                                            1) {
                                                          viewModel.updateCart(
                                                              context: context,
                                                              productId: viewModel
                                                                  .userCartInfo[
                                                                      index]
                                                                  .product!
                                                                  .id!,
                                                              quantity: viewModel
                                                                      .userCartInfo[
                                                                          index]
                                                                      .quantity! -
                                                                  1);
                                                        }
                                                      }),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(left: 10),
                                //   child: Row(
                                //     children: [
                                //       SizedBox(
                                //         height: 20.h,
                                //         child: Styles.regular(
                                //           viewModel.userCartInfo.isNotEmpty
                                //               ? "${viewModel.userCartInfo[index].price}"
                                //               : "0",
                                //           fontSize: 17.sp,
                                //           color: black,
                                //         ),
                                //       ),
                                //       SizedBox(width: 10.w),
                                //       Padding(
                                //         padding: EdgeInsets.only(left: 150),
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.end,
                                //           children: [
                                //             Container(
                                //               height: 40.h,
                                //               width: 40.w,
                                //               decoration: BoxDecoration(
                                //                   color: grey.withOpacity(0.2),
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           10)),
                                //               child: IconButton(
                                //                   icon: Icon(Icons.add),
                                //                   onPressed: () {
                                //                     if (viewModel
                                //                             .userCartInfo[index]
                                //                             .quantity! <
                                //                         viewModel
                                //                             .userCartInfo[index]
                                //                             .product!
                                //                             .stock!) {
                                //                       viewModel.updateCart(
                                //                           context: context,
                                //                           productId: viewModel
                                //                               .userCartInfo[
                                //                                   index]
                                //                               .id!,
                                //                           quantity: {
                                //                             viewModel
                                //                                     .userCartInfo[
                                //                                         index]
                                //                                     .quantity! +
                                //                                 1
                                //                           }.toString());
                                //                     }
                                //                   }),
                                //             ),
                                //             SizedBox(width: 20.w),
                                //             Styles.regular(
                                //               viewModel.userCartInfo.isNotEmpty
                                //                   ? "${viewModel.userCartInfo[index].quantity}"
                                //                   : "0",
                                //               fontSize: 25.sp,
                                //               color: black,
                                //             ),
                                //             SizedBox(width: 20.w),
                                //             Container(
                                //               height: 40.h,
                                //               width: 40.w,
                                //               decoration: BoxDecoration(
                                //                   color: grey.withOpacity(0.2),
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           10.r)),
                                //               child: IconButton(
                                //                   icon: Icon(Icons.remove),
                                //                   onPressed: () {
                                //                     if (viewModel
                                //                             .userCartInfo[index]
                                //                             .quantity! >
                                //                         1) {
                                //                       viewModel.updateCart(
                                //                           context: context,
                                //                           productId: viewModel
                                //                               .userCartInfo[
                                //                                   index]
                                //                               .id!,
                                //                           quantity: {
                                //                             viewModel
                                //                                     .userCartInfo[
                                //                                         index]
                                //                                     .quantity! -
                                //                                 1
                                //                           }.toString());
                                //                     }
                                //                   }),
                                //             ),
                                //           ],
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10.h);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            tristate: true,
                            shape: CircleBorder(),
                            activeColor: primaryColor,
                            onChanged: (value) {
                              // viewModel.checkCart(value!);

                              viewModel.switchCart();
                            },
                            value: viewModel.switchAll,
                          ),
                          Styles.bold(
                            "All",
                            fontSize: 18.sp,
                            color: Color(0xff7B61FF),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 1)),
                      height: 50.h,
                      width: 150.w,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMessageScreen()),
                      ),
                      splashColor: white,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Styles.bold(
                                "\$${viewModel.total.toString()}",
                                fontSize: 16.5.sp,
                                color: white,
                              ),
                              Styles.bold(
                                "Send gift",
                                fontSize: 16.5.sp,
                                color: white,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(color: primaryColor, width: 1),
                        ),
                        height: 50.h,
                        width: 220.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
