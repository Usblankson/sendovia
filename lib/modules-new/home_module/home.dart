import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/authentication/login.dart';
import 'package:planetx/modules-new/home_module/constants.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:planetx/shared/widgets/gift_notifiication_card.dart';
import 'package:planetx/shared/widgets/home_screen_top.dart';
import 'package:planetx/shared/widgets/popular_item.dart';
import 'package:planetx/shared/widgets/scroll_cta_tag_widget.dart';
import 'package:planetx/shared/data/home_screen_lists.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../shared/utils/color.dart';
import '../send_gift_module/send_gift.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeList data = HomeList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VSpace(4.h),
                homeScreenHeader(context, 'Kingsley'),
                VSpace(24.h),
                Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Container(
                      height: 160.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText('Send gift with ease', 18.sp, FontWeight.w600,
                              white, 0.sp, 0.h, null),
                          VSpace(8.h),
                          AppText(
                              'Explore your gift horizon. begin to \nsend gifts easily without hassle.',
                              14.sp,
                              FontWeight.w400,
                              white,
                              0.sp,
                              0.h,
                              null),
                          VSpace(16.h),
                          Container(
                            width: 115.w,
                            height: 35.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: AppText('Send a gift', 14.sp,
                                FontWeight.w600, primaryColor, 0, 0.h, () {
                              showModalBottomSheet(
                                constraints: BoxConstraints.expand(
                                    height: deviceHeight(context) / 2),
                                isDismissible: true,
                                enableDrag: true,
                                isScrollControlled: true,
                                elevation: 5,
                                barrierColor: Colors.grey.withOpacity(0.5),
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Column(
                                      //  crossAxisAlignment: CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Text("Select a gift",
                                                style: TextStyle(
                                                    color: Color(0xff5A67E7),
                                                    fontFamily: "PT Sans",
                                                    fontSize: 16.5.sp,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.close)),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () => Nav.forward(
                                                  context, const SendGift()),
                                              child: Container(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 35),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                budgetBottomSheet(context);
                                              },
                                              child: Container(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 35.h),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: Color(0xffF4D3EB)),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8.0.r),
                        ),
                        child: Image.asset(
                          giftBox,
                          fit: BoxFit.cover,
                          width: 121.12.w,
                          height: 90.h,
                        ),
                      ),
                    ),
                  ],
                ),
                VSpace(16.h),
                CustomTextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  hintText: 'Search items',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(search, width: 16.w, height: 16.h),
                  ),
                ),
                VSpace(24.h),
                scrollActionTag(
                    context, 'Popular Items', 'See all', const LogIn()),
                SizedBox(
                  height: 160.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return popularItem(data.popularItems[index]['image'],
                          data.popularItems[index]['name']);
                    },
                  ),
                ),
                giftNotificationCard('Kingsley', 'Deji'),
                scrollActionTag(
                    context, 'Categories', 'See all', const LogIn()),
                SizedBox(
                  height: 160.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.categories.length,
                    itemBuilder: (context, index) {
                      return popularItem(data.categories[index]['image'],
                          data.categories[index]['name']);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
