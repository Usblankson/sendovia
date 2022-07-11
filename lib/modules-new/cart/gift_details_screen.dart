import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/cart/summary_screen.dart';
import 'package:planetx/modules-new/cart/viewmodel/cart_vm.dart';
import 'package:planetx/modules/auth/widgets/textform_field_with_icon.dart';
import 'package:planetx/shared/models/beneficiary_model.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/base_view.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/utils/color.dart';

class GiftDetailScreen extends StatelessWidget {
  GiftDetailScreen({Key? key}) : super(key: key);

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
                    child: Styles.semiBold("Gift Details",
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
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 1,
                  // itemCount: viewModel.userCartInfo.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          // border: Border.all(
                          //     color: primaryColor, width: 1.1),
                          borderRadius: BorderRadius.circular(8.r),
                          color: inputFieldColor),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
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
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: viewModel.userCartInfo.isEmpty
                                    ? Image.asset(
                                        "assets/images/store-product.png",
                                        fit: BoxFit.fill,
                                      )
                                    : viewModel.userCartInfo[index].product!
                                                .image !=
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Styles.semiBold(
                                    viewModel.userCartInfo.isEmpty
                                        ? "New AirPods 2019"
                                        : viewModel.userCartInfo[index].product!
                                                .name ??
                                            "New AirPods 2019",
                                    fontSize: 12.sp,
                                    color: textColorDark,
                                  ),
                                  VSpace(4.h),
                                  Styles.semiBold(
                                    viewModel.userCartInfo.isEmpty
                                        ? "New AirPods 2019...."
                                        : viewModel.userCartInfo[index].product!
                                                .description ??
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
              // Divider(),
              // VSpace(12.h),
              Padding(
                padding: EdgeInsets.only(
                  // bottom: 16.h,
                  top: 12.h,
                  left: 20.w,
                  right: 20.w,
                ),
                child: Styles.semiBold(
                  "+ Add new item",
                  fontSize: 14.sp,
                  underline: true,
                  color: primaryColor,
                ),
              ),
              Divider(),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: ListView(
                    children: [
                      Styles.regular("Beneficiary details",
                          color: textColorDark, fontSize: 18.sp),
                      VSpace(16.h),
                      Styles.regular("Phone Number",
                          color: grey, fontSize: 12.sp),
                      VSpace(8.h),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormFieldWithIcon(
                              controller: viewModel.phoneNoCtrl,
                            ),
                          ),
                          HSpace(8.w),
                          GestureDetector(
                              onTap: () {
                                viewModel.fetchContacts(context);
                              },
                              child: Container(
                                width: 56.w,
                                height: 56.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffF3F3F3),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: EdgeInsets.all(16.sp),
                                child: CircleAvatar(
                                    backgroundColor: grey,
                                    radius: 6.r,
                                    child: Icon(
                                      Icons.person,
                                      color: white,
                                    )),
                              ))
                        ],
                      ),
                      VSpace(24.h),
                      Styles.regular("Full Name", color: grey, fontSize: 12.sp),
                      VSpace(8.h),
                      TextFormFieldWithIcon(
                        controller: viewModel.nameCtrl,
                      ),
                      VSpace(24.h),
                      Styles.regular("Email", color: grey, fontSize: 12.sp),
                      VSpace(8.h),
                      TextFormFieldWithIcon(
                        controller: viewModel.emailCtrl,
                      ),
                      VSpace(24.h),
                      Styles.regular("Message", color: grey, fontSize: 12.sp),
                      VSpace(8.h),
                      Container(
                        height: 100.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: greyWhite, width: 1.sp),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r),
                          ),
                        ),
                        child: TextField(
                            controller: viewModel.msgCtrl,
                            keyboardType: TextInputType.multiline,
                            maxLength: null,
                            maxLines: null,
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: "type your message",
                                hintStyle: TextStyle(
                                  fontSize: 10.sp,
                                  color: greyWhite,
                                )),
                            style: TextStyle(
                              height: 2.0,
                              color: black,
                            )),
                      ),
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
                    title: "Continue",
                    onPress: viewModel.userCartInfo.isEmpty
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SummaryScreen(
                                  cartPayload: viewModel.userCartInfo,
                                  contacts: BeneficiaryModel(
                                      email: viewModel.emailCtrl.text,
                                      message: viewModel.msgCtrl.text,
                                      fullName: viewModel.nameCtrl.text,
                                      phoneNo: viewModel.phoneNoCtrl.text),
                                ),
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
