import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sendovia/utils/app_text.dart';

import 'package:sendovia/utils/images.dart';
import 'package:sendovia/utils/space.dart';
import 'package:sendovia/widgets/custom_button.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/navigation.dart';
import '../../../../widgets/gift_details_widget.dart';
import '../../../../widgets/gift_history_message_widget.dart';
import '../../../../widgets/sender_or_receiver_widget.dart';

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
            "Received", 18.sp, FontWeight.w600, textColor, 0, 0, null),
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
