// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/notification/notifications.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/widgets/space.dart';

Widget homeScreenHeader(
  BuildContext context,
  String userName,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              dp1,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
          HSpace(12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  'Hello', 14, FontWeight.w300, supportTextColor, 0, 1.8, null),
              AppText('$userName, 👋🏼', 14, FontWeight.w400, textColorDark, 0,
                  1.8, null)
            ],
          )
        ],
      ),
      InkWell(
        onTap: () => Nav.forward(context, Notifications()),
        child: Image.asset(
          notification,
          width: 32,
          height: 32,
        ),
      )
    ],
  );
}
