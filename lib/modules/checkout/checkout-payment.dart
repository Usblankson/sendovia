// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';

class CheckOutPaymentScreen extends StatefulWidget {
  const CheckOutPaymentScreen({Key key}) : super(key: key);

  @override
  State<CheckOutPaymentScreen> createState() => _CheckOutPaymentScreenState();
}

class _CheckOutPaymentScreenState extends State<CheckOutPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic selected = true;
    dynamic unselected = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 20.w),
                    Styles.bold(
                      "Checkout",
                      fontSize: 17.sp,
                      color: black,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Styles.bold(
                      "cards",
                      fontSize: 15.sp,
                      color: black,
                    ),
                    SizedBox(width: 20.w),
                    InkWell(
                      onTap: () {},
                      splashColor: primaryColor,
                      child: Styles.bold(
                        "Edit",
                        fontSize: 12.sp,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 30.h),
                Container(
                  height: 250.h,
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: paleWhite,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: grey,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 4),
                            ]),
                        height: 80.h,
                        width: double.infinity.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/logos_mastercard.png",
                                    fit: BoxFit.fill,
                                    height: 30,
                                    width: 40,
                                  ),
                                  SizedBox(width: 20.w),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.h),
                                    child: Column(
                                      children: [
                                        Styles.regular(
                                          "My Payoneer",
                                          fontSize: 12.sp,
                                          color: black,
                                        ),
                                        SizedBox(height: 5.h),
                                        Styles.bold(
                                          "5399 11** **** 1234",
                                          fontSize: 12.sp,
                                          color: grey,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Checkbox(
                                tristate: true,
                                shape: CircleBorder(),
                                activeColor: secondaryBlue,
                                onChanged: (value) {
                                  setState(() {
                                    selected = value;
                                  });
                                },
                                value: selected,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10.h);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Styles.bold(
                      "Add New Card",
                      fontSize: 15.sp,
                      color: primaryColor,
                    ),
                    SizedBox(width: 20.w),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: primaryColor,
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 350),
                  child: SizedBox(height: 20.h),
                ),

                SizedBox(height: 20.h),
                Container(
                  width: double.infinity.w,
                  height: 55.h,
                  decoration: BoxDecoration(color: primaryColor),
                  child: Center(
                    child: Styles.bold(
                      "Confirm Payment",
                      fontSize: 16.sp,
                      color: white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
