import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/modules-new/receiving_module/delivery_details_screen.dart';
import 'package:planetx/modules-new/receiving_module/feedback_screen.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/space.dart';
import '../../shared/utils/color.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/custom_button.dart';
import '../cart/viewmodel/cart_vm.dart';

class ReceivingScreen extends StatelessWidget {
  const ReceivingScreen({Key? key}) : super(key: key);

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
      backgroundColor: lightGrey,
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
                    Styles.semiBold("Hey! Kingsley  you’ve got a gift",
                        color: textColorDark, fontSize: 16.sp),
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
                                    HSpace(11.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Styles.semiBold(
                                          viewModel.userCartInfo.isEmpty
                                              ? "New AirPods 2019"
                                              : viewModel.userCartInfo[index]
                                                      .product!.name ??
                                                  "New AirPods 2019",
                                          fontSize: 12.sp,
                                          color: textColorDark,
                                        ),
                                        VSpace(4.h),
                                        Styles.semiBold(
                                          viewModel.userCartInfo.isEmpty
                                              ? "New AirPods 2019...."
                                              : viewModel.userCartInfo[index]
                                                      .product!.description ??
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
              Divider(color: white),
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
                    Styles.semiBold("From", color: grey, fontSize: 14.sp),
                    VSpace(12.h),
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
                    ),
                  ],
                ),
              ),
              Divider(color: white),
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
                color: white,
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 16.h,
                  left: 20.w,
                  right: 20.w,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: CustomButton(
                          width: double.infinity.w,
                          height: 48.h,
                          radius: 24.r,
                          isActive: true,
                          color: blue,
                          title: "Decline",
                          onPress: () {
                            showModalBottomSheet(
                              constraints: BoxConstraints.expand(height: 390.h),
                              isDismissible: true,
                              enableDrag: true,
                              isScrollControlled: true,
                              elevation: 5,
                              barrierColor: Colors.grey.withOpacity(0.5),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    child: Column(
                                  children: [
                                    Center(
                                        child: Image.asset(
                                            "assets/images/decline.png",
                                            width: 47.67.w,
                                            height: 48.h)),
                                    VSpace(27.h),
                                    Styles.semiBold("Decline Gift",
                                        color: textColorDark, fontSize: 22.sp),
                                    VSpace(12.h),
                                    Styles.regular(
                                        "You can still pick your prefered gift within the same budget.",
                                        color: grey,
                                        align: TextAlign.center,
                                        fontSize: 16.sp),
                                    VSpace(47.h),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: CustomButton(
                                              width: double.infinity.w,
                                              height: 48.h,
                                              radius: 24.r,
                                              isActive: true,
                                              color: blue,
                                              title: "Decline",
                                              onPress: () {}),
                                        ),
                                        HSpace(15.h),
                                        Flexible(
                                          child: CustomButton(
                                              width: double.infinity.w,
                                              height: 48.h,
                                              radius: 24.r,
                                              isActive: viewModel
                                                  .userCartInfo.isNotEmpty,
                                              color: blue,
                                              title: "Pick a gift",
                                              onPress: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        FeedbackScreen(),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ],
                                    )
                                  ],
                                ));
                              },
                            );
                          }),
                    ),
                    HSpace(15.h),
                    Flexible(
                      child: CustomButton(
                          width: double.infinity.w,
                          height: 48.h,
                          radius: 24.r,
                          isActive: viewModel.userCartInfo.isNotEmpty,
                          color: blue,
                          title: "Accept",
                          onPress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DeliveryDetailsScreen(),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
