import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 10.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MainRouter.generateRoute(
                                    RouteSettings(
                                        name: RoutePaths.storeProductScreen),
                                  ),
                                ),
                            icon: Icon(Icons.arrow_back)),
                        Styles.bold(
                          "Recent",
                          fontSize: 16.sp,
                          color: black,
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: primaryColor,
                      onTap: () {},
                      child: SizedBox(
                          height: 23.h,
                          child:
                              Image.asset("assets/images/settings_icon.png")),
                    )
                  ],
                ),
                Center(
                  child: Styles.regular("Today",
                      fontSize: 13.sp,
                      color: gretGrey,
                      fontStyle: FontStyle.italic),
                ),
                Container(
                  height: 300.h,
                  child: ListView.separated(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        height: 23.h,
                                        child: Image.asset(
                                            "assets/images/group.png")),
                                    SizedBox(width: 20.w),
                                    Styles.regular(
                                      "You sent a gift to Deji @user26785",
                                      fontSize: 13.sp,
                                      color: black,
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: grey, size: 17),
                              ],
                            ),
                            color: paleWhite,
                            height: 50.h,
                            width: 40.w);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.h);
                      }),
                ),
                Center(
                  child: Styles.regular("Older",
                      fontSize: 13.sp,
                      color: gretGrey,
                      fontStyle: FontStyle.italic),
                ),
                Container(
                  height: 300.h,
                  child: ListView.separated(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        height: 23.h,
                                        child: Image.asset(
                                            "assets/images/group-send.png")),
                                    SizedBox(width: 20.w),
                                    Styles.regular(
                                      "You received a gift from Deji @user26785",
                                      fontSize: 13.sp,
                                      color: black,
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: grey, size: 17),
                              ],
                            ),
                            color: paleWhite,
                            height: 50.h,
                            width: 40.w);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.h);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
