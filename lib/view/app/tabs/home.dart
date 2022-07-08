import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:sendovia/utils/app_text.dart';
import 'package:sendovia/utils/colors.dart';
import 'package:sendovia/utils/space.dart';
import 'package:sendovia/utils/utils.dart';
import 'package:sendovia/view/authentication/login.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';
import 'package:sendovia/widgets/gift_notifiication_card.dart';
import 'package:sendovia/widgets/home_screen_top.dart';
import 'package:sendovia/widgets/popular_item.dart';
import 'package:sendovia/widgets/scroll_cta_tag_widget.dart';

import '../../../utils/images.dart';
import '../data/home_screen_lists.dart';

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
                            child: AppText('Send a gift', 14.sp, FontWeight.w600,
                                primaryColor, 0, 0.h, () {


                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  backgroundColor: primaryColor, 
                                content: const Text(
                                    "Please add add the send gift route on line 79"),
                              ));
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
