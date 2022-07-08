import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendovia/utils/images.dart';

import '../utils/app_text.dart';
import '../utils/colors.dart';
import '../utils/space.dart';

Widget giftDetails() {
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: 18.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            AppText("Gift details", 14.sp, FontWeight.w500, black, 0, 1.6, null),
            VSpace(8.h),
            AppText("23 Feb 2021 | 10:30 Am", 14.sp, FontWeight.w400, supportTextColor, 0, 2.2, null),
            VSpace(12.h),
            Row(
            children: [
              Image.asset(
                earbud,
                width: 81.w,
                height: 83.h,
              ),
              HSpace(8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('Airpods', 12.sp, FontWeight.w500, textColor, 0, 1.6.h,
                      null),
                  const VSpace(4),
                  AppText('Qty 1, white', 12.sp, FontWeight.w400,
                      supportTextColor, 0, 1.6.h, null),
                  const VSpace(4),
                  
      
                  AppText('\$99', 14.sp, FontWeight.w500, black, 0, 1.6.h, null),
                ],
              ),
            ],
          ),
          ],
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50.w,
                height: 15.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: AppText(
                    'Delivered', 8.sp, FontWeight.w400, white, 0, 1, null),
              ),
            ],
          ),
      ],
    ),
  );
}
