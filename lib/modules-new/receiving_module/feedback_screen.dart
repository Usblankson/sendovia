import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/modules-new/cart/viewmodel/cart_vm.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/base_view.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../shared/utils/color.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key key}) : super(key: key);

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
                  child: Styles.semiBold("Feedback",
                      fontSize: 20.sp, color: black),
                ),
              ],
            ),
          ),
          preferredSize: Size(double.infinity, 30.h),
        ),
      ),
      body: Container(
        width: deviceWidth(context),
        height: deviceHeight(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.only(
                  top: 12.h,
                  left: 20.w,
                  right: 20.w,
                ),
                child: ListView(
                  children: [
                    Styles.regular("Please enter your reasons for declining.",
                        color: grey, fontSize: 16.sp),
                    VSpace(16.h),
                    Styles.regular("Comment", color: grey, fontSize: 12.sp),
                    VSpace(8.h),
                    Container(
                      height: 100.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
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
                  isActive: true,
                  color: blue,
                  title: "Send",
                  onPress: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => SuccessScreen(),
                    //   ),
                    // );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
