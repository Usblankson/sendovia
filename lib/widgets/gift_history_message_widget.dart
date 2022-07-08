import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendovia/utils/app_text.dart';
import 'package:sendovia/utils/colors.dart';

import '../utils/space.dart';

Widget giftHistoryMessage() {
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: 14.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText("Message", 14.sp, FontWeight.w500, black, 0, 1.6, null),
        VSpace(14.h),
        AppText(
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint consequat duis enim velit consequat amet dolor.",
          14.sp,
          FontWeight.w400,
          supportTextColor,
          0,
          2.2.h,
          null,
        ),
      ],
    ),
  );
}
