import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/models/data.dart';
import 'package:planetx/shared/utils/styles.dart';

import '../../shared/utils/color.dart';

class StoreProductScreen extends StatelessWidget {
  const StoreProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        Styles.regular(
                          "Send a gift",
                          fontSize: 16.sp,
                          color: black,
                        ),
                      ],
                    ),
                    Row(children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      SizedBox(height: 30),
                    ])
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/store-product.png",
                          ),
                          fit: BoxFit.cover)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Top Tek',
                            style: TextStyle(
                                color: black,
                                fontFamily: "PT Sans",
                                fontSize: 20,
                                height: 2,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text:
                                '\ntoptek stores specialize in top \nquality bluetooth technology  ',
                            style: TextStyle(
                                color: primaryGrey,
                                fontFamily: "PT Sans",
                                fontSize: 14,
                                height: 2,
                                fontWeight: FontWeight.w400)),
                      ],
                    )),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Styles.regular(
                          "5.0 (20)",
                          fontSize: 16.sp,
                          color: black,
                        ),
                      ],
                    ),
                  ],
                ),
                ListView.separated(
                  itemCount: storesProductLists.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MainRouter.generateRoute(
                          RouteSettings(name: RoutePaths.checkProduct),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 70.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/store-product.png",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                              // child:
                              //     Image.asset(storesProductLists[index].image),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h),
                                Styles.semiBold(
                                    storesProductLists[index].storeName,
                                    fontSize: 16.sp,
                                    color: black,
                                    height: 2.h),
                                Styles.regular(
                                    storesProductLists[index].description,
                                    fontSize: 11.sp,
                                    color: black,
                                    height: 2.h),
                                SizedBox(height: 20.h),
                              ],
                            ),
                            Text(
                              storesProductLists[index].price,
                              style: TextStyle(
                                  color: black,
                                  fontFamily: "PT Sans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 15);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
