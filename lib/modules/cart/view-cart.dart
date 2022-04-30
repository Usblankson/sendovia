// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic selected = true;
    dynamic unselected = false;
    return Scaffold(
      backgroundColor: grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
          child: Container(
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
                          "Cart (2)",
                          fontSize: 16.sp,
                          color: black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: black,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: black,
                              size: 30,
                            )),
                      ],
                    ),
                  ],
                ),
                //  SizedBox(height: 70.h),
                Container(
                  height: 720.h,
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 1.1),
                            borderRadius: BorderRadius.circular(10),
                            color: white),
                        height: 220.h,
                        width: 343.w,
                        child: Row(
                          children: [
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                        child: Image.asset(
                                            "assets/images/cart-texticon.png"),
                                      ),
                                      SizedBox(width: 10.w),
                                      Styles.regular(
                                        "Toptek Stores",
                                        fontSize: 16.sp,
                                        color: black,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/store-product.png",
                                        fit: BoxFit.fill,
                                        height: 122,
                                        width: 140,
                                      ),
                                      SizedBox(width: 15.w),
                                      Styles.regular(
                                        "New AirPods Expected Later This \nYear as Suppliers Begin \nComponent ..",
                                        fontSize: 10.5.sp,
                                        height: 2,
                                        color: black,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                          child: Styles.regular(
                                            "\$1000",
                                            fontSize: 17.sp,
                                            color: black,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Padding(
                                          padding: EdgeInsets.only(left: 150),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 30.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    color:
                                                        grey.withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Icon(Icons.add),
                                              ),
                                              SizedBox(width: 20.w),
                                              Styles.regular(
                                                "1",
                                                fontSize: 25.sp,
                                                color: black,
                                              ),
                                              SizedBox(width: 20.w),
                                              Container(
                                                height: 30.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    color:
                                                        grey.withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: Icon(Icons.remove),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            tristate: true,
                            shape: CircleBorder(),
                            activeColor: primaryColor,
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                              });
                            },
                            value: selected,
                          ),
                          Styles.bold(
                            "All",
                            fontSize: 18.sp,
                            color: Color(0xff7B61FF),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 1)),
                      height: 50.h,
                      width: 150.w,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MainRouter.generateRoute(
                          RouteSettings(name: RoutePaths.checkoutscreen),
                        ),
                      ),
                      splashColor: white,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Styles.bold(
                                "\$3000",
                                fontSize: 16.5.sp,
                                color: white,
                              ),
                              Styles.bold(
                                "Send gift",
                                fontSize: 16.5.sp,
                                color: white,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(color: primaryColor, width: 1),
                        ),
                        height: 50.h,
                        width: 220.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
