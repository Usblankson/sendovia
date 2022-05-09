// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules/send_gift/viewmodel/sendgift_vm.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/space.dart';
import '../../core/service_injector/service_injector.dart';
import '../../router/main_router.dart';
import '../../router/route_paths.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_button.dart';

class AddMessageScreen extends StatelessWidget {
  AddMessageScreen({
    Key? key,
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
            title: "Select gift",
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
                Container(
                  width: deviceWidth(context),
                  height: 160.sp,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: lightPurple,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8.r)),
                              ),
                              HSpace(19.w),
                              Container(
                                height: 76.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Styles.bold(
                                          "Airpods Pro",
                                          color: black,
                                          fontSize: 14.sp,
                                        ),
                                        VSpace(7.h),
                                        Styles.regular(
                                          "Color - White",
                                          fontSize: 14.sp,
                                        ),
                                      ],
                                    ),
                                    Styles.regular(r"$100",
                                        fontSize: 20.sp, color: black),
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
                ),
                VSpace(24.h),
                Container(
                  width: deviceWidth(context),
                  height: 160.sp,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: lightPurple,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: kRed,
                              ),
                              HSpace(19.33.w),
                              Styles.regular("Select beneficiary",
                                  fontSize: 14.sp, color: black),
                            ],
                          ),
                          Icon(
                            Icons.add,
                            color: black,
                          ),
                        ],
                      ),
                      Styles.regular(
                        "From your contacts",
                        color: black,
                        fontSize: 10.sp,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 51.h,
                                width: 51.w,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              HSpace(19.w),
                              Container(
                                height: 51.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Styles.regular("johndoe@gmail.com",
                                        fontSize: 14.sp),
                                    VSpace(8.h),
                                    Styles.regular(r"+234 7041995858",
                                        fontSize: 14.sp),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Styles.regular("Change", color: primaryColor),
                        ],
                      ),
                      Styles.regular(
                        "David A",
                        fontSize: 10.sp,
                        color: black,
                      ),
                    ],
                  ),
                ),
                VSpace(24.h),
                Styles.regular("Drop a message", color: black, fontSize: 14.sp),
                VSpace(11.h),
                Container(
                    height: 178.h,
                    decoration: BoxDecoration(
                      // color: lightPurple,
                      border: Border.all(color: greyWhite, width: 1.sp),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 178.h,
                          width: (deviceWidth(context) * 0.65),
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
                              // controller: ,
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
                        Container(
                          height: 178.h,
                          width: (deviceWidth(context) * 0.35) - 34.h,
                          decoration: BoxDecoration(
                            // color: kRed,
                            border: Border.all(color: greyWhite, width: 1.sp),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/gift.png"),
                              VSpace(10.h),
                              Styles.regular('Select Card',
                                  fontSize: 10.sp, color: greyWhite)
                            ],
                          ),
                        ),
                      ],
                    )),
                Spacer(),
                CustomButton(
                    width: double.infinity.w,
                    height: 48.h,
                    isActive: true,
                    color: blue,
                    title: "Confirm",
                    onPress: () {
                      Navigator.push(
                        context,
                        MainRouter.generateRoute(
                          RouteSettings(name: RoutePaths.summaryScreen),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
