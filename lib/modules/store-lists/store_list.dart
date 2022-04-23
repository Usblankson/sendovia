// ignore_for_file: unnecessary_import, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/models/data.dart';
import 'package:planetx/shared/utils/styles.dart';

import '../../shared/utils/color.dart';

class StoresLists extends StatelessWidget {
  const StoresLists({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Budget';
    String categories = 'Category';

    // List of items in our dropdown menu
    var items = [
      'Budget',
      'below- ₦1,000',
      '₦1,000 - ₦5,000',
      '₦5,000 - ₦10,000',
      '₦10,000 - ₦20, 000',
      '₦20,000 - ₦50, 000'
    ];
    var categoriesItems = [
      'Category',
      'Home',
      'Fitness',
      'Tech',
      'Flowers',
    ];
    var dropdownValue;
    return Scaffold(
      //   backgroundColor: Color(0xffE5E5E5),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h),
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
                                        name: RoutePaths.storeProduct),
                                  ),
                                ),
                            icon: Icon(Icons.arrow_back)),
                        Styles.bold(
                          "Send a gift",
                          fontSize: 16.sp,
                          color: black,
                        ),
                      ],
                    ),
                    Row(children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.grid_view_outlined)),
                      SizedBox(height: 30.h),
                    ])
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180.w,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: 'Budget',
                              isDense: true,
                              isExpanded: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Budget',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 180.w,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: 'Category',
                              isDense: true,
                              isExpanded: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Category',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                  itemCount: storesLists.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MainRouter.generateRoute(
                          RouteSettings(name: RoutePaths.storeProduct),
                        ),
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                // decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //         image: AssetImage(
                                //             storesLists[index].image),
                                //         fit: BoxFit.contain)),
                                height: 150.h,
                                width: 170.w,
                                child: Image.asset(
                                  storesLists[index].image,
                                  fit: BoxFit.cover,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffEAE419),
                                        ),
                                        Styles.regular(
                                          storesLists[index].rating,
                                          fontSize: 16.sp,
                                          color: Color(0xffEAE419),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Styles.semiBold(
                                  storesLists[index].storeName,
                                  fontSize: 15.sp,
                                  color: black,
                                  height: 2,
                                ),
                                Styles.regular(
                                  storesLists[index].description,
                                  fontSize: 10.5.sp,
                                  color: black,
                                  height: 2,
                                ),
                                SizedBox(height: 20.h),
                                Styles.semiBold(
                                  storesLists[index].price,
                                  fontSize: 14.sp,
                                  color: black,
                                  // height: 2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
