import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/shared/models/data.dart';
import 'package:planetx/shared/widgets/floating_button.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../shared/utils/color.dart';
import '../../shared/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  // final List<PopularImages>? popularImages;
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FAB(),
      backgroundColor: Color(0xffE5E5E5),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 14.w),
                        Styles.regular(
                          "Hi Joe",
                          fontSize: 17.sp,
                          color: black,
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          child: Center(
                            child: Styles.semiBold(
                              r"$12.50",
                              fontSize: 14.sp,
                              color: kRed,
                            ),
                          ),
                          height: 30.h,
                          width: 65.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: blue, width: 0.5)),
                        )
                      ],
                    ),
                    Image.asset(
                      "assets/images/sendovia_logo.png",
                      height: 40.h,
                      width: 90.w,
                    )
                  ],
                ),
                SizedBox(height: 26.h),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xffC2B5B5),
                        ),
                        SizedBox(width: 16.w),
                        Text("Search items or services",
                            style: TextStyle(
                                color: Color(0xff9D9D9D),
                                fontFamily: "Epilogue",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(color: Color(0xffF6F6F6)),
                  height: 45,
                  width: double.infinity,
                ),
                SizedBox(height: 24.h),
                headingRow(title: "Popular", subTitle: "see all"),
                VSpace(14.h),
                Popular(),
                VSpace(26.h),
                headingRow(title: "Categories", subTitle: "see all"),
                VSpace(14.h),
                Categories(),
                VSpace(40.h),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                            "Explore your gift horizon. begin to send \n\ngifts easily without hassle.",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "PT Sans",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/explore-gift.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                  //  color: Colors.red,
                  height: 250.h,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Popular extends StatelessWidget {
  const Popular({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      child: GridView.count(
        // shrinkWrap: ,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 9.0,
        children: List.generate(
          popularImages.length,
          (index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Column(
                children: [
                  Container(
                    height: 75.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      //   color: Color(0xffEEEEEE),
                    ),
                    child:
                        // Image.asset(popularImages[index].image)

                        Center(
                      child: Image.asset(
                        popularImages[index].image,
                        fit: BoxFit.contain,
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(popularImages[index].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "PT sans",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: GridView.count(
        // shrinkWrap: ,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 9.0,
        children: List.generate(
          popularCategories.length,
          (index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Column(
                children: [
                  Container(
                    height: 75.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: Color(0xffEEEEEE),
                    ),
                    child:
                        // Image.asset(popularImages[index].image)

                        Center(
                      child: Image.asset(
                        popularCategories[index].image,
                        fit: BoxFit.contain,
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  VSpace(12.h),
                  Text(popularCategories[index].title,
                      style: TextStyle(
                          color: black,
                          fontFamily: "PT sans",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Row headingRow({
  String title,
  String subTitle,

  //  required VoidCallback onTapped
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 14.sp,
            color: black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontFamily: 'PT Sans'),
      ),
      InkWell(
        onTap: () {},
        child: Text(
          subTitle,
          style: TextStyle(
              fontSize: 14.sp,
              color: secondaryBlue,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontFamily: 'PT Sans'),
        ),
      ),
    ],
  );
}
