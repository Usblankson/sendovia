// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules/send_gift/viewmodel/sendgift_vm.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/space.dart';
import '../../core/service_injector/service_injector.dart';
import '../../shared/models/cart_model.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_button.dart';

class SummaryScreen extends StatelessWidget {
  Contact contact;
  List<PayloadFromCart> cartPayload;
  String message;
  SummaryScreen({
    Key key,
    this.contact,
    this.cartPayload,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SendGiftViewModel>(
      vmBuilder: (context) => SendGiftViewModel(
          context: context, sendGiftService: si.sendGiftService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, SendGiftViewModel viewModel) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(deviceWidth(context), 64.0.h),
          child: CustomAppBar(
            backgroundColor: white,
            txtColor: black,
            title: "Summary",
            height: 64.0.h,
            backBtn: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            width: deviceWidth(context),
            height: deviceHeight(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Styles.regular("Package", fontSize: 14.sp, color: black),
                VSpace(8.h),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Container(
                //           height: 76.h,
                //           width: 75.w,
                //           decoration: BoxDecoration(
                //               color: primaryColor,
                //               borderRadius: BorderRadius.circular(8.r)),
                //         ),
                //         HSpace(19.w),
                //         Container(
                //           height: 76.h,
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Styles.bold(
                //                     "Airpods Pro",
                //                     color: black,
                //                     fontSize: 14.sp,
                //                   ),
                //                   VSpace(7.h),
                //                   Styles.regular(
                //                     "Color - White",
                //                     fontSize: 14.sp,
                //                   ),
                //                 ],
                //               ),
                //               Styles.regular(r"$100",
                //                   fontSize: 20.sp, color: black),
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //
                //     Row(
                //       children: [
                //         Icon(
                //           Icons.add,
                //           color: primaryColor,
                //           size: 16.sp,
                //         ),
                //         HSpace(32.w),
                //         Icon(
                //           Icons.edit,
                //           color: primaryColor,
                //           size: 16.sp,
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                Expanded(
                  child: ListView.separated(
                    itemCount: cartPayload.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: deviceWidth(context),
                        // height: 160.sp,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 20.h),
                        decoration: BoxDecoration(
                          color: lightPurple,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.done,
                                  color: kRed,
                                ),
                                HSpace(19.33.w),
                                Styles.regular("Select gift",
                                    fontSize: 14.sp, color: black),
                              ],
                            ),
                            VSpace(20.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 76.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                        color: grey.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child:
                                          cartPayload[index].product.image !=
                                                  null
                                              ? Image.network(
                                                  cartPayload[index]
                                                      .product
                                                      .image,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.asset(
                                                  "assets/images/store-product.png",
                                                  fit: BoxFit.fill,
                                                ),
                                    ),
                                    HSpace(19.w),
                                    Container(
                                      height: 76.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Styles.bold(
                                                cartPayload[index]
                                                        .product
                                                        .name ??
                                                    "Airpods Pro",
                                                color: black,
                                                fontSize: 14.sp,
                                              ),
                                              VSpace(7.h),
                                              Styles.regular(
                                                "Quantity: ${cartPayload[index].quantity}",
                                                fontSize: 14.sp,
                                              ),
                                            ],
                                          ),
                                          Styles.regular(
                                              "\$${cartPayload[index].price}",
                                              fontSize: 20.sp,
                                              color: black),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Styles.regular("Change", color: primaryColor),
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
                // VSpace(16.h),
                // Divider(),
                VSpace(16.h),
                Styles.regular("Sending to", fontSize: 14.sp, color: black),
                VSpace(8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 75.h,
                          width: 76.w,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        HSpace(19.w),
                        Container(
                          height: 75.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Styles.regular("john doe",
                              //     color: black, fontSize: 14.sp),
                              // VSpace(8.h),
                              // Styles.regular("johndoe@gmail.com",
                              //     fontSize: 14.sp),
                              // VSpace(8.h),
                              // Styles.regular(r"+234 7041995858",
                              //     fontSize: 14.sp),
                              Styles.regular(
                                  "${contact.name.first} ${contact.name.last}",
                                  fontSize: 14.sp),
                              VSpace(8.h),
                              Styles.regular(
                                  "${contact.emails.isNotEmpty ? contact.emails.first : '(none)'}",
                                  fontSize: 14.sp),
                              VSpace(8.h),
                              Styles.regular(
                                  "${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}",
                                  fontSize: 14.sp),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: primaryColor,
                          size: 16.sp,
                        ),
                        HSpace(32.w),
                        Icon(
                          Icons.edit,
                          color: primaryColor,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                VSpace(16.h),
                Divider(),
                VSpace(16.h),
                Styles.regular("Message", color: black, fontSize: 14.sp),
                VSpace(11.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: deviceWidth(context) * 0.75,
                      child: Styles.regular(message ??
                          'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Nulla quis lorem ut libero malesuada '),
                    ),
                    Icon(
                      Icons.edit,
                      color: primaryColor,
                      size: 16.sp,
                    ),
                  ],
                ),
                Spacer(),
                CustomButton(
                    width: double.infinity.w,
                    height: 48.h,
                    isActive: true,
                    color: blue,
                    title: "Send a gift",
                    onPress: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
