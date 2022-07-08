import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_text.dart';
import '../utils/colors.dart';
import '../utils/navigation.dart';
import '../utils/space.dart';
import '../view/app/screens/history_screens/received.dart';
import '../view/app/screens/history_screens/sent.dart';

Widget historyCard(
  BuildContext context,
  String fromScreen,
   String image,
  String name,
  String date,
  String recipient,
  String price,
  String status,
) {
 
  return GestureDetector(
    onTap: () {
      fromScreen == 'sent'
          ? Nav.forward(context, const Sent() )
          : Nav.forward(context, const Received() );
    },
    child: Container(
      height: 93.h,
     
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: inputFieldColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                width: 81.w,
                height: 83.h,
              ),
              HSpace(8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(name, 12.sp, FontWeight.w500, textColor, 0, 1.6.h,
                      null),
                  const VSpace(4),
                  AppText(date, 12.sp, FontWeight.w400,
                      supportTextColor, 0, 1.6.h, null),
                  const VSpace(4),
                  RichText(
                    strutStyle: StrutStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.6.h,
                    ),
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Recipient: ',
                            style: TextStyle(color: supportTextColor)),
                        TextSpan(
                            text: recipient,
                            style: TextStyle(color: textColor)),
                      ],
                    ),
                  ),
                  const VSpace(4),
                  AppText('\$$price', 14.sp, FontWeight.w500, black, 0, 1.6.h, null),
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
                    status, 8.sp, FontWeight.w400, white, 0, 1, null),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
