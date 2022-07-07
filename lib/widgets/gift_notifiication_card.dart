import 'package:flutter/cupertino.dart';

import '../utils/app_text.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/spacing.dart';

Widget giftNotificationCard(
  String userName,
  String senderName,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom:16),
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: darkBlueColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('Hey! $userName', 16, FontWeight.w500, white, 0, 2, null),
              const YMargin(4),
              AppText('you’ve got a gift from $senderName', 16, FontWeight.w500, white,
                  0, 2, null),
              AppText('Click to view gift details', 14, FontWeight.w400, gray, 0,
                  2, () {})
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8.0),
            ),
            child: Image.asset(
              giftBox1,
              fit: BoxFit.cover,
              width: 121.12,
              height: 90,
            ),
          ),
        ),
      ],
    ),
  );
}
