import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';

import 'package:planetx/shared/widgets/custom_button.dart';

class FAB extends StatelessWidget {
  const FAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          constraints: BoxConstraints.expand(height: 390),
          isDismissible: true,
          enableDrag: true,
          isScrollControlled: true,
          elevation: 5,
          barrierColor: Colors.grey.withOpacity(0.5),
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Container(
                  child: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text("Select a gift",
                              style: TextStyle(
                                  color: Color(0xff5A67E7),
                                  fontFamily: "PT Sans",
                                  fontSize: 16.5.sp,
                                  fontWeight: FontWeight.w400)),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close)),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MainRouter.generateRoute(
                                RouteSettings(name: RoutePaths.storesList),
                              ),
                            ),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 35),
                                child: Column(
                                  children: [
                                    Center(
                                        child: Image.asset(
                                      "assets/images/browse-gift.png",
                                      height: 30.h,
                                      width: 50.w,
                                    )),
                                    SizedBox(height: 10.h),
                                    Styles.regular(
                                      "Browse gift",
                                      fontSize: 15.sp,
                                      color: black,
                                    ),
                                    SizedBox(height: 10.h),
                                    Styles.regular(
                                      "Find something spectacular",
                                      fontSize: 10.sp,
                                      color: black,
                                    ),
                                  ],
                                ),
                              ),
                              height: 170.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffD8DBFB),
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                constraints:
                                    BoxConstraints.expand(height: 390.h),
                                isDismissible: true,
                                enableDrag: true,
                                isScrollControlled: true,
                                elevation: 5,
                                barrierColor: Colors.grey.withOpacity(0.5),
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.w),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Center(
                                                    child: Styles.bold(
                                                        '1000 - 2000',
                                                        fontSize: 14.sp,
                                                        color: grey),
                                                  ),
                                                  height: 40.h,
                                                  width: 105.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      border: Border.all(
                                                          color: black,
                                                          width: 0.5)),
                                                ),
                                                Container(
                                                  child: Center(
                                                    child: Styles.bold(
                                                        '1000 - 2000',
                                                        fontSize: 14.sp,
                                                        color: grey),
                                                  ),
                                                  height: 40.h,
                                                  width: 115.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      border: Border.all(
                                                          color: black,
                                                          width: 0.5)),
                                                ),
                                                Container(
                                                  child: Center(
                                                    child: Styles.bold(
                                                        '1000 - 2000',
                                                        fontSize: 14.sp,
                                                        color: grey),
                                                  ),
                                                  height: 40.h,
                                                  width: 115.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      border: Border.all(
                                                          color: black,
                                                          width: 0.5)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.h),
                                            Container(
                                              child: Center(
                                                child: Styles.bold(
                                                    'above - 2000',
                                                    fontSize: 14.sp,
                                                    color: grey),
                                              ),
                                              height: 40.h,
                                              width: 115.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                  border: Border.all(
                                                      color: black,
                                                      width: 0.5)),
                                            ),
                                            SizedBox(height: 30.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Styles.regular('\$',
                                                    fontSize: 17.sp,
                                                    color: grey),
                                                Container(
                                                  height: 45.h,
                                                  width: 160.w,
                                                  decoration: BoxDecoration(
                                                      color: grey
                                                          .withOpacity(0.3)),
                                                ),
                                                // SizedBox(width: 20.w),
                                                Container(
                                                  height: 2.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                      color: grey),
                                                ),
                                                //     SizedBox(width: 20.w),
                                                Container(
                                                  height: 45.h,
                                                  width: 150.w,
                                                  decoration: BoxDecoration(
                                                      color: grey
                                                          .withOpacity(0.3)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 30.h),
                                            Align(
                                              alignment: Alignment.center,
                                              child: CustomButton(
                                                  title: "Continue",
                                                  isActive: true,
                                                  onPress: () {}),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 35.h),
                                child: Column(
                                  children: [
                                    Center(
                                        child: Image.asset(
                                      "assets/images/send-gift.png",
                                      height: 30,
                                      width: 50,
                                    )),
                                    SizedBox(height: 10.h),
                                    Styles.regular(
                                      "Send a gift collection",
                                      fontSize: 15.sp,
                                      color: black,
                                    ),
                                    SizedBox(height: 10.h),
                                    Styles.regular(
                                      "Pick with a budget",
                                      fontSize: 10.sp,
                                      color: black,
                                    ),
                                  ],
                                ),
                              ),
                              height: 170,
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color(0xffF4D3EB)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 52,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,

            end: Alignment.bottomCenter,
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              Color(0xff0C80E4),
              Color(0xffF304BE),
            ],
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/gift-box.png",
              height: 30,
              width: 50,
            ),
            Text("Send a gift",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PT Sans",
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
