import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/send_gift_module/constant.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';

import '../../shared/widgets/space.dart';
import '../../shared/utils/app_text.dart';
import '../../shared/utils/images.dart';
import '../../shared/utils/navigation.dart';
import '../../shared/widgets/custom_text_form_field.dart';
import '../../shared/widgets/gift_item_widget.dart';

class ShopDetailsScreen extends StatelessWidget {
  const ShopDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          shadowColor: appbarShadowColor.withOpacity(0.1),
          toolbarHeight: Platform.isAndroid ? 70.h : 50.h,
          toolbarOpacity: 0.5,
          backgroundColor: white,
          elevation: 1,
          bottomOpacity: 0.1,
          leading: IconButton(
              icon: Image.asset(
                backBtn,
                width: 24.w,
                height: 24.h,
              ),
              onPressed: () {
                Nav.back(context);
              }),
          title: AppText(
              "Send a gift", 18.sp, FontWeight.w600, textColorDark, 0, 0, null),
          // actions: [
          //   IconButton(
          //       icon: Image.asset(
          //         search,
          //         width: 15.64.w,
          //         height: 18.02.h,
          //       ),
          //       onPressed: () {}),
          // ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  bonton,
                  fit: BoxFit.cover,
                  width: deviceWidth(context),
                  height: 132.h,
                ),
              ),
              VSpace(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Styles.semiBold(
                    "The Gift Shop",
                    color: textColorDark,
                    fontSize: 16.sp,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      stars(1, 1),
                      Styles.regular(
                        "4.5",
                        color: textColorDark,
                        fontSize: 14.sp,
                      ),
                      Styles.regular(
                        "(37)",
                        color: supportTextColor,
                        fontSize: 14.sp,
                      ),
                    ],
                  )
                ],
              ),
              VSpace(6.h),
              Container(
                width: 250.w,
                child: Styles.regular(
                    'Specialize on different kinds of gifts items ranging from tech to fashion etc.',
                    color: supportTextColor,
                    fontSize: 12.sp),
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                maxLines: 1,
                hintText: 'Search items',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Image.asset(search, width: 16.w, height: 16.h),
                ),
              ),
              VSpace(29.h),
              Expanded(
                  child: ListView.separated(
                      itemCount: 2,
                      itemBuilder: (context, _) {
                        return GestureDetector(
                          onTap: () {
                            productDetailsBottomSheet(context);
                          },
                          child: Container(
                            height: 93.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              // color: inputFieldColor,
                              border: Border.all(
                                  width: 1.0, color: inputFieldColor),

                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      bonton,
                                      fit: BoxFit.fill,
                                      width: 81.w,
                                      height: 65.h,
                                    ),
                                    HSpace(8.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                            "Airpods",
                                            12.sp,
                                            FontWeight.w500,
                                            textColorDark,
                                            0,
                                            1.6.h,
                                            null),
                                        const VSpace(4),
                                        AppText(
                                            "Specialize on different kinds of gifts.",
                                            12.sp,
                                            FontWeight.w400,
                                            supportTextColor,
                                            0,
                                            1.6.h,
                                            null),
                                        VSpace(4.h),
                                        AppText(
                                            '\$ price',
                                            14.sp,
                                            FontWeight.w500,
                                            black,
                                            0,
                                            1.6.h,
                                            null),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.h);
                      }))
            ])));
  }
}
