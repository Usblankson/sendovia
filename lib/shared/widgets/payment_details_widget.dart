import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/space.dart';

Widget paymentDetails() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 18.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText("Payment Details", 14.sp, FontWeight.w500, black, 0, 1.6, null),
        VSpace(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText("Subtotal", 14.sp, FontWeight.w400, supportTextColor, 0,
                    1.6, null),
                VSpace(8.h),
                AppText("Delivery Fee", 14.sp, FontWeight.w400,
                    supportTextColor, 0, 1.6, null),
                VSpace(8.h),
                AppText("Total", 14.sp, FontWeight.w400, black, 0, 1.6, null),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText("₦4,700.00", 14.sp, FontWeight.w400, supportTextColor,
                    0, 1.6, null),
                VSpace(8.h),
                AppText("₦300.00", 14.sp, FontWeight.w400, supportTextColor, 0,
                    1.6, null),
                VSpace(8.h),
                AppText(
                    "₦5,000.00", 14.sp, FontWeight.w500, black, 0, 1.6, null),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
