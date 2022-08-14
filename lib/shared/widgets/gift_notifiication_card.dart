import 'package:flutter/cupertino.dart';

import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/widgets/space.dart';

Widget giftNotificationCard(
  String userName,
  String senderName,
    Function() action
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
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
              const VSpace(4),
              AppText('you’ve got a gift from $senderName', 16, FontWeight.w500,
                  white, 0, 2, null),
              AppText('Click to view gift details', 14, FontWeight.w400, gray,
                  0, 2, action)
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
