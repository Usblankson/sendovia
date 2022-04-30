import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Styles.bold(
                      "Delivery details",
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
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 35,
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Styles.regular("Deji @user2234",
                            fontSize: 13.sp, color: black, height: 1.5),
                        Styles.regular("+234 706 213 123",
                            fontSize: 13.sp, height: 1.5, color: black),
                        Styles.regular(
                            "23, Beku street, Victoria island, Lagos",
                            fontSize: 13.sp,
                            height: 2,
                            color: black),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Styles.bold(
                      "Order details",
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
                SizedBox(height: 30.h),
                Container(
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
                  height: 150.h,
                  width: double.infinity.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/store-product.png",
                          fit: BoxFit.fill,
                          height: 100,
                          width: 140,
                        ),
                        SizedBox(width: 20.w),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Styles.regular(
                                "Airpods 2017,  White",
                                fontSize: 14.sp,
                                color: black,
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Styles.regular(
                                    "Airpods",
                                    fontSize: 12.sp,
                                    color: grey,
                                  ),
                                  SizedBox(width: 130.w),
                                  Styles.regular(
                                    "X1",
                                    fontSize: 12.sp,
                                    color: black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              Styles.regular(
                                "\$100",
                                fontSize: 15.sp,
                                color: black,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 230),
                  child: SizedBox(height: 20.h),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Center(
                        child: Styles.regular(
                          "Enter coupon code",
                          fontSize: 16.sp,
                          color: grey,
                        ),
                      ),
                      height: 55.h,
                      width: 260,
                      decoration: BoxDecoration(color: paleWhite),
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: paleWhite,
                      child: Container(
                        height: 55.h,
                        width: 100,
                        decoration: BoxDecoration(color: primaryColor),
                        child: Center(
                          child: Styles.bold(
                            "Use",
                            fontSize: 16.sp,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MainRouter.generateRoute(
                      RouteSettings(name: RoutePaths.checkoutpaymentscreen),
                    ),
                  ),
                  child: Container(
                    width: double.infinity.w,
                    height: 55.h,
                    decoration: BoxDecoration(color: primaryColor),
                    child: Center(
                      child: Styles.bold(
                        "Proceed to Pay \$100",
                        fontSize: 16.sp,
                        color: white,
                      ),
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
