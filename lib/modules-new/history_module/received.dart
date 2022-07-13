import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/widgets/gift_details_widget.dart';
import 'package:planetx/shared/widgets/gift_history_message_widget.dart';
import 'package:planetx/shared/widgets/sender_or_receiver_widget.dart';

class Received extends StatefulWidget {
  const Received({Key key}) : super(key: key);

  @override
  State<Received> createState() => _ReceivedState();
}

class _ReceivedState extends State<Received> {
  bool isVisible = false;
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
            "Received", 18.sp, FontWeight.w600, textColorDark, 0, 0, null),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              giftDetails(),
              Divider(
                color: gray,
                thickness: 2.h,
              ),
              senderOrReceiver('Sender'),
              Divider(
                color: gray,
                thickness: 2.h,
              ),
              giftHistoryMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
