import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/utils/color.dart';
import '../../shared/utils/styles.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/space.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 24.sp),
          child: Column(
            children: [
              VSpace(120.h),
              Center(
                  child: Image.asset("assets/images/success.png",
                      width: 165.67.w, height: 135.67.h)),
              VSpace(8.h),
              Styles.semiBold("successful", color: white, fontSize: 20.sp),
              VSpace(22.h),
              Styles.regular(
                  "A message has been sent to recipient for confirmation  ",
                  color: white,
                  align: TextAlign.center,
                  fontSize: 16.sp),
              VSpace(8.h),
              CustomButton(
                  width: double.infinity.w,
                  height: 48.h,
                  radius: 24.r,
                  isActive: true,
                  color: white,
                  txtColor: primaryColor,
                  title: "Continue",
                  onPress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SuccessScreen(),
                      ),
                    );
                  }),
              VSpace(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.link,
                    color: white,
                  ),
                  Styles.regular("  Share link",
                      align: TextAlign.center, color: white, fontSize: 14.sp),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
