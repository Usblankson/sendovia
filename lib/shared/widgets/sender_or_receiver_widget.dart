import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/widgets/space.dart';

Widget senderOrReceiver(
  String tag,
) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 18.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText("Beneficiary", 14.sp, FontWeight.w500, black, 0, 1.6, null),
        VSpace(14.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage(nullAvatar)),
                    borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.all(20),
              ),
            ),
            HSpace(18.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText("Faith Smith", 14.sp, FontWeight.w500, textColorDark, 0,
                    1.6.h, null),
                VSpace(8.h),
                AppText("faithsmitn@gmail.com", 14.sp, FontWeight.w400,
                    textColorDark, 0, 1.6.h, null),
                VSpace(8.h),
                AppText('+2347 033 321 8457', 14.sp, FontWeight.w400,
                    supportTextColor, 0, 1.6.h, null),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
