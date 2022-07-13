import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/send_gift_module/send_gift.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/custom_button.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../shared/utils/color.dart';
import '../../shared/utils/navigation.dart';

budgetBottomSheet(context) {
  return showModalBottomSheet(
    constraints: BoxConstraints.expand(height: deviceHeight(context) - 90.h),
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    elevation: 5,
    barrierColor: Colors.grey.withOpacity(0.5),
    backgroundColor: Colors.grey.withOpacity(0.5),
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.0, color: primaryColor),
                      ),
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 12.sp,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  VSpace(38.h),
                  Styles.semiBold("Budget Range",
                      fontSize: 16.sp, color: textColorDark),
                  VSpace(12.h),
                  Divider(),
                  VSpace(24.h),
                  Styles.regular('Below NGN 1,000',
                      fontSize: 14.sp, color: grey),
                  VSpace(24.h),
                  Divider(),
                  VSpace(24.h),
                  Styles.regular('N1,000 - N5,000',
                      fontSize: 14.sp, color: grey),
                  VSpace(24.h),
                  Divider(),
                  VSpace(24.h),
                  Styles.regular('N5,000 - N10,000',
                      fontSize: 14.sp, color: grey),
                  VSpace(24.h),
                  Divider(),
                  VSpace(24.h),
                  Styles.regular('N10,000 - N20,000',
                      fontSize: 14.sp, color: grey),
                  VSpace(24.h),
                  Divider(),
                  VSpace(24.h),
                  Styles.regular('N20,000 - N50,000',
                      fontSize: 14.sp, color: grey),
                  VSpace(24.h),
                  Divider(),
                  VSpace(24.h),
                  Styles.semiBold("Customer budget",
                      fontSize: 16.sp, color: textColorDark),
                  VSpace(24.h),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          child: Styles.regular("Min (NGN)", color: grey),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Styles.regular("Max (NGN)",
                                align: TextAlign.left, color: grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          // label: 'First Name',
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      HSpace(17.w),
                      Expanded(
                        child: CustomTextFormField(
                          // label: 'Last Name',
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      title: "Continue",
                      color: primaryColor,
                      isActive: true,
                      onPress: () {
                        Navigator.pop(context);
                        Nav.forward(context, const SendGift());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
