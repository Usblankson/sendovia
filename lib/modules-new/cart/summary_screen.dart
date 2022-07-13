import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/cart/success_screen.dart';
import 'package:planetx/modules-new/cart/viewmodel/cart_vm.dart';
import 'package:planetx/shared/models/beneficiary_model.dart';
import 'package:planetx/shared/models/cart_model.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/utils/color.dart';
import '../../shared/utils/styles.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/space.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({Key key, this.contacts, this.cartPayload}) : super(key: key);

  BeneficiaryModel contacts;
  List<PayloadFromCart> cartPayload;

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
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1.0, color: primaryColor),
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 12.sp,
                          color: primaryColor,
                        ),
                      ),
                      // Styles.semiBold("Back", color: black, fontSize: 15.sp),
                    ],
                  ),
                ),
                HSpace(20.w),
                Expanded(
                    child: Styles.semiBold("Summary",
                        fontSize: 20.sp, color: black)),
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
          width: deviceWidth(context),
          // height: double.infinity,
          height: deviceHeight(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 16.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Styles.semiBold("Gift Details",
                        color: textColorDark, fontSize: 14.sp),
                    VSpace(12.h),
                    Container(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: 1,
                        // itemCount: viewModel.userCartInfo.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 65.h,
                                      width: 81.w,
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
                                                  viewModel.userCartInfo[index]
                                                      .product.image,
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
                                          viewModel.userCartInfo.isEmpty
                                              ? "New AirPods 2019...."
                                              : viewModel.userCartInfo[index]
                                                      .product.description ??
                                                  "New AirPods 2019.....",
                                          fontSize: 12.sp,
                                          color: grey,
                                        ),
                                        VSpace(4.h),
                                        Styles.semiBold(
                                          viewModel.userCartInfo.isNotEmpty
                                              ? "\$ ${viewModel.userCartInfo[index].price}"
                                              : "\$ 0",
                                          fontSize: 14.sp,
                                          color: textColorDark,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Styles.regular(
                                      "Change",
                                      fontSize: 12.sp,
                                      color: primaryColor,
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
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.only(
                  // bottom: 16.h,
                  top: 12.h,
                  left: 20.w,
                  right: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles.semiBold("Beneficiary",
                        color: textColorDark, fontSize: 14.sp),
                    VSpace(12.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: white,
                            size: 60.sp,
                          ),
                          backgroundColor: grey,
                          radius: 30.r,
                        ),
                        HSpace(18.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Styles.semiBold("${contacts.fullName}",
                                color: textColorDark, fontSize: 14.sp),
                            VSpace(8.h),
                            Styles.regular("${contacts.email}",
                                color: grey, fontSize: 14.sp),
                            VSpace(8.h),
                            Styles.regular("${contacts.phoneNo}",
                                color: grey, fontSize: 14.sp),
                            VSpace(8.h),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                    // bottom: 16.h,
                    top: 12.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Styles.semiBold("Message",
                          color: textColorDark, fontSize: 14.sp),
                      VSpace(12.h),
                      Styles.regular("${contacts.message}",
                          color: grey, fontSize: 14.sp),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              Container(
                padding: EdgeInsets.only(
                  top: 10.h,
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
                    title: "Proceed to pay ₦ ${viewModel.total}",
                    onPress: viewModel.userCartInfo.isEmpty
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SuccessScreen(),
                              ),
                            );
                          }
                        : () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
