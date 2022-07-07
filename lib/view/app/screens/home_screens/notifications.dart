import 'package:flutter/material.dart';
import 'package:sendovia/utils/app_text.dart';
import 'package:sendovia/utils/images.dart';

import 'package:sendovia/view/app/screens/account_screens/edit_profile.dart';
import 'package:sendovia/widgets/notification_card_widget.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/spacing.dart';
import '../../../../widgets/Custom_list_tile.dart';
import '../../data/home_screen_lists.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

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
        toolbarHeight: 70,
        toolbarOpacity: 0.5,
        backgroundColor: white,
        elevation: 3,
        bottomOpacity: 0.1,
        leading: IconButton(
            icon: Image.asset(
              backBtn,
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Nav.back(context);
            }),
        title: AppText(
          'Notification',
          20,
          FontWeight.w500,
          textColor,
          0,
          3.2,
          null,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(30),
            AppText("Today", 14, FontWeight.w400, supportTextColor, 0, 1.6,
                () {}),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.notifications.length,
                itemBuilder: (context, index) {
                  return notificationCard(data.notifications[index]['status'], data.notifications[index]['name']);
                },
              ),)
          ],
        ),
      ),
    );
  }
}
