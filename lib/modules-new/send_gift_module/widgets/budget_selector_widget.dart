import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/modules-new/receiving_module/delivery_details_screen.dart';
import 'package:planetx/modules-new/receiving_module/feedback_screen.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../../shared/utils/color.dart';
// class BudgetSelectorWidget extends StatelessWidget {
//   const BudgetSelectorWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

budgetSelectorWidget(context) {
  showModalBottomSheet(
    constraints: BoxConstraints.expand(height: deviceHeight(context).h),
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    elevation: 5,
    barrierColor: Colors.grey.withOpacity(0.5),
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Styles.semiBold(
                      "Pick a budget",
                      fontSize: 17.sp,
                      color: black,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Center(
                        child: Styles.bold('1000 - 2000',
                            fontSize: 14.sp, color: grey),
                      ),
                      height: 40.h,
                      width: 105.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: black, width: 0.5)),
                    ),
                    Container(
                      child: Center(
                        child: Styles.bold('1000 - 2000',
                            fontSize: 14.sp, color: grey),
                      ),
                      height: 40.h,
                      width: 115.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: black, width: 0.5)),
                    ),
                    Container(
                      child: Center(
                        child: Styles.bold('1000 - 2000',
                            fontSize: 14.sp, color: grey),
                      ),
                      height: 40.h,
                      width: 115.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: black, width: 0.5)),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  child: Center(
                    child: Styles.bold('above - 2000',
                        fontSize: 14.sp, color: grey),
                  ),
                  height: 40.h,
                  width: 115.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: black, width: 0.5)),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Styles.regular('\$', fontSize: 17.sp, color: grey),
                    Container(
                      height: 45.h,
                      width: 160.w,
                      decoration: BoxDecoration(color: grey.withOpacity(0.3)),
                    ),
                    // SizedBox(width: 20.w),
                    Container(
                      height: 2.h,
                      width: 30.w,
                      decoration: BoxDecoration(color: grey),
                    ),
                    //     SizedBox(width: 20.w),
                    Container(
                      height: 45.h,
                      width: 150.w,
                      decoration: BoxDecoration(color: grey.withOpacity(0.3)),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                      title: "Continue", isActive: true, onPress: () {}),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
