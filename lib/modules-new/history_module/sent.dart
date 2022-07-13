import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/authentication/login.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/modules-new/authentication/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/gift_details_widget.dart';
import 'package:planetx/shared/widgets/gift_history_message_widget.dart';
import 'package:planetx/shared/widgets/payment_details_widget.dart';
import 'package:planetx/shared/widgets/sender_or_receiver_widget.dart';

class Sent extends StatefulWidget {
  const Sent({Key key}) : super(key: key);

  @override
  State<Sent> createState() => _SentState();
}

class _SentState extends State<Sent> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          title: "Resend gift",
          onPress: () => Nav.forward(context, const LogIn()),
          isActive: true,
          hasElevation: false,
          txtColor: primaryColor,
          color: white,
          borderColor: primaryColor,
        ),
      ),
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
        title: AppText("Sent", 18.sp, FontWeight.w600, black, 0, 3.2, null),
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
              senderOrReceiver('Beneficiary'),
              Divider(
                color: gray,
                thickness: 2.h,
              ),
              giftHistoryMessage(),
              Divider(
                color: gray,
                thickness: 2.h,
              ),
              paymentDetails(),
              Divider(
                color: gray,
                thickness: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
