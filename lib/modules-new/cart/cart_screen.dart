import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/cart/gift_details_screen.dart';
import 'package:planetx/modules-new/cart/viewmodel/cart_vm.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/utils/styles.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CartViewModel>(
      vmBuilder: (context) =>
          CartViewModel(context: context, cartService: si.cartService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, CartViewModel viewModel) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: white,
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.only(left: 14.w, bottom: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   child: GestureDetector(
                //     onTap: () => Navigator.pop(context),
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.arrow_back_ios,
                //           size: 12.sp,
                //           color: black,
                //         ),
                //         Styles.semiBold("Back",
                //             color: black, fontSize: 15.sp),
                //       ],
                //     ),
                //   ),
                // ),
                // HSpace(50.w),
                Expanded(
                    child:
                        Styles.semiBold("Cart", fontSize: 20.sp, color: black)),
                // Expanded(child: Container())
              ],
            ),
          ),
          preferredSize: Size(double.infinity, 30.h),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.refreshContent,
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// don't delete
              viewModel.userCartInfo.isEmpty
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset("assets/images/shoppingcart.png"),
                          // VSpace(27.h),
                          Styles.regular(
                            "No item in your cart",
                            fontSize: 16.sp,
                            color: textColorDark,
                            align: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  :

                  /// don't delete
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 16.h,
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: viewModel.userCartInfo.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: primaryColor, width: 1.1),
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: inputFieldColor),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Styles.semiBold(
                                    viewModel.userCartInfo.isEmpty
                                        ? "Toptek Stores"
                                        : viewModel.userCartInfo[index].product
                                                .name ??
                                            "Toptek Stores",
                                    fontSize: 14.sp,
                                    color: textColorDark,
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 86.h,
                                        width: 88.w,
                                        decoration: BoxDecoration(
                                          color: grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: viewModel.userCartInfo.isEmpty
                                            ? Image.asset(
                                                "assets/images/store-product.png",
                                                fit: BoxFit.fill,
                                              )
                                            : viewModel.userCartInfo[index]
                                                        .product.image !=
                                                    null
                                                ? Image.network(
                                                    viewModel
                                                        .userCartInfo[index]
                                                        .product
                                                        .image,
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.asset(
                                                    "assets/images/store-product.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                      ),
                                      HSpace(11.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Styles.semiBold(
                                            viewModel.userCartInfo.isEmpty
                                                ? "New AirPods 2019"
                                                : viewModel.userCartInfo[index]
                                                        .product.name ??
                                                    "New AirPods 2019",
                                            fontSize: 12.sp,
                                            color: textColorDark,
                                          ),
                                          VSpace(4.h),
                                          Styles.semiBold(
                                            viewModel.userCartInfo.isNotEmpty
                                                ? "\$${viewModel.userCartInfo[index].price}"
                                                : "0",
                                            fontSize: 14.sp,
                                            color: textColorDark,
                                          ),
                                          VSpace(12.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 32.h,
                                                width: 32.w,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r)),
                                                child: IconButton(
                                                    icon: Icon(
                                                      Icons.remove,
                                                      color: white,
                                                      size: 12.sp,
                                                    ),
                                                    onPressed: () {
                                                      if (viewModel
                                                              .userCartInfo[
                                                                  index]
                                                              .quantity >
                                                          1) {
                                                        viewModel.updateCart(
                                                            context: context,
                                                            productId: viewModel
                                                                .userCartInfo[
                                                                    index]
                                                                .product
                                                                .id,
                                                            quantity: viewModel
                                                                    .userCartInfo[
                                                                        index]
                                                                    .quantity -
                                                                1);
                                                      }
                                                    }),
                                              ),
                                              SizedBox(width: 12.w),
                                              Styles.regular(
                                                viewModel
                                                        .userCartInfo.isNotEmpty
                                                    ? "${viewModel.userCartInfo[index].quantity}"
                                                    : "0",
                                                fontSize: 15.sp,
                                                color: black,
                                              ),
                                              SizedBox(width: 12.w),
                                              Container(
                                                height: 32.h,
                                                width: 32.w,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r)),
                                                child: IconButton(
                                                    icon: Icon(Icons.add,
                                                        color: white,
                                                        size: 12.sp),
                                                    onPressed: () {
                                                      if (viewModel
                                                              .userCartInfo[
                                                                  index]
                                                              .quantity <
                                                          viewModel
                                                              .userCartInfo[
                                                                  index]
                                                              .product
                                                              .stock) {
                                                        viewModel.updateCart(
                                                            context: context,
                                                            productId: viewModel
                                                                .userCartInfo[
                                                                    index]
                                                                .product
                                                                .id,
                                                            quantity: viewModel
                                                                    .userCartInfo[
                                                                        index]
                                                                    .quantity +
                                                                1);
                                                      }
                                                    }),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            viewModel.removeFromCartID();
                                          },
                                          padding: EdgeInsets.all(6.r),
                                          icon: Icon(
                                            Icons.delete,
                                            color: black,
                                            // size: 20.sp,
                                          ),
                                        ),
                                      ),
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
                    ),
              //
              Visibility(
                visible: viewModel.userCartInfo.isNotEmpty,
                child: Container(
                  padding: EdgeInsets.only(
                    // bottom: 16.h,
                    top: 6.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Divider(),
                      VSpace(12.h),
                      Styles.semiBold(
                        "Payment Details",
                        fontSize: 14.sp,
                        color: textColorDark,
                      ),
                      VSpace(12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Styles.regular(
                            "Subtotal",
                            fontSize: 14.sp,
                            color: grey,
                          ),
                          Styles.regular(
                            "\$ ${viewModel.total} ",
                            fontSize: 14.sp,
                            color: grey,
                          ),
                        ],
                      ),
                      VSpace(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Styles.regular(
                            "Delivery Fee",
                            fontSize: 14.sp,
                            color: grey,
                          ),
                          Styles.regular(
                            "\$ ${viewModel.total} ",
                            fontSize: 14.sp,
                            color: grey,
                          ),
                        ],
                      ),
                      VSpace(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Styles.regular(
                            "Total",
                            fontSize: 14.sp,
                            color: textColorDark,
                          ),
                          Styles.regular(
                            "\$ ${viewModel.total} ",
                            fontSize: 14.sp,
                            color: grey,
                          ),
                        ],
                      ),
                      VSpace(8.h),
                      Divider(),
                    ],
                  ),
                ),
              ),
              VSpace(8.h),
              Container(
                padding: EdgeInsets.only(
                  bottom: 16.h,
                  left: 20.w,
                  right: 20.w,
                ),
                child: CustomButton(
                    width: double.infinity.w,
                    height: 48.h,
                    radius: 24.r,
                    isActive: viewModel.userCartInfo.isNotEmpty,
                    color: blue,
                    title: "Send gift (₦ ${viewModel.total})",
                    onPress: () {
                      Nav.forward(context, GiftDetailScreen());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
