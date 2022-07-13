import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/cart/gift_details_screen.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../shared/utils/color.dart';

productDetailsBottomSheet(context, {viewModel}) {
  return showModalBottomSheet(
    constraints:
        BoxConstraints.expand(height: (deviceHeight(context) * 0.73).sp),
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    elevation: 5,
    barrierColor: Colors.grey.withOpacity(0.5),
    context: context,
    backgroundColor: Colors.grey.withOpacity(0.5),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 202.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    image: AssetImage(bonton),

                    // NetworkImage(
                    //   viewModel.productInfo.image,
                    // ),
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
                      SizedBox(height: 9),
                      Styles.semiBold(
                        // viewModel.productInfo.name ?? "Airpods Pro Max",
                        "Airpods Pro Max",
                        fontSize: 14.sp,
                        color: textColorDark,
                      ),
                      SizedBox(height: 9.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Styles.regular(
                            // viewModel.productInfo.description ??
                            //     "New AirPods Expected Later This \nYear as Suppliers Begin \nComponent ..",
                            "New AirPods Expected Later This \nYear as Suppliers Begin \nComponent ..",
                            fontSize: 14.sp,
                            color: grey,
                          ),
                          Styles.semiBold(
                            // "\$ ${viewModel.productInfo.price.toString() ?? "00"}",
                            "00",
                            fontSize: 18.sp,
                            color: textColorDark,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Styles.regular(
                                "Colors",
                                fontSize: 14.sp,
                                color: grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Styles.regular(
                            "Quantity",
                            fontSize: 14.sp,
                            color: grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 32.h,
                                width: 32.w,
                                decoration: BoxDecoration(
                                    color: grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: IconButton(
                                    icon: Icon(Icons.add),
                                    iconSize: 16.sp,
                                    onPressed: () {
                                      if (viewModel.quantityToPurchase <
                                          viewModel.productInfo.stock) {
                                        viewModel.quantityToPurchase =
                                            viewModel.quantityToPurchase + 1;
                                        viewModel.notify();
                                      }
                                    }),
                              ),
                              HSpace(30.w),
                              Styles.regular(
                                // "${viewModel.quantityToPurchase}",
                                "1",
                                fontSize: 16.sp,
                                color: grey,
                              ),
                              HSpace(30.w),
                              Container(
                                height: 32.h,
                                width: 32.w,
                                decoration: BoxDecoration(
                                    color: grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: IconButton(
                                    icon: Icon(Icons.remove),
                                    iconSize: 16.sp,
                                    onPressed: () {
                                      if (viewModel.quantityToPurchase > 1) {
                                        viewModel.quantityToPurchase =
                                            viewModel.quantityToPurchase - 1;
                                        viewModel.notify();
                                      }
                                    }),
                              ),
                            ],
                          )
                        ],
                      ),
                      VSpace(16.h),
                      Divider(),
                      VSpace(16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // viewModel.addToCart(
                              //     context: context,
                              //     cartId: productID,
                              //     quantity:
                              //     viewModel.quantityToPurchase);
                            },
                            child: Container(
                              child: Center(
                                child: Styles.semiBold(
                                  "Add to Cart",
                                  fontSize: 16.sp,
                                  color: primaryColor,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.r),
                                  border: Border.all(color: grey, width: 1)),
                              height: 55.h,
                              width: 180.w,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Nav.forward(context, GiftDetailScreen()),
                            child: Container(
                              height: 55.h,
                              width: 180.w,
                              child: Center(
                                child: Styles.semiBold(
                                  "Send gift",
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      VSpace(20.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
