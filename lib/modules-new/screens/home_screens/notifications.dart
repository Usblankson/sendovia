import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/utils/app_text.dart';
import 'package:planetx/modules-new/utils/colors.dart';
import 'package:planetx/modules-new/utils/images.dart';
import 'package:planetx/modules-new/utils/navigation.dart';
import 'package:planetx/modules-new/widgets/notification_card_widget.dart';
import 'package:planetx/shared/widgets/space.dart';
import '../../data/home_screen_lists.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  HomeList data = HomeList();
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
          'Notification',
          20.sp,
          FontWeight.w600,
          textColor,
          0,
          0,
          null,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VSpace(30.h),
            AppText("Today", 14.sp, FontWeight.w400, supportTextColor, 0, 1.6,
                () {}),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.notifications.length,
                itemBuilder: (context, index) {
                  return notificationCard(data.notifications[index]['status'],
                      data.notifications[index]['name'], () {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
