// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:sendovia/view/app/screens/home_screens/notifications.dart';

import '../utils/app_text.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/navigation.dart';
import '../utils/spacing.dart';

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
          const XMargin(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  'Hello', 14, FontWeight.w300, supportTextColor, 0, 1.8, null),
              AppText('$userName, 👋🏼', 14, FontWeight.w400, textColor, 0, 1.8,
                  null)
            ],
          )
        ],
      ),
      InkWell(
        onTap: () => Nav.forward(context,  Notifications()),
        child: Image.asset(
          notification,
          width: 32,
          height: 32,
        ),
      )
    ],
  );
}
