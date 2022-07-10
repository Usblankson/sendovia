import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/styles.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
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
                                RouteSettings(name: RoutePaths.storeProductScreen),
                              ),
                            ),
                        icon: Icon(Icons.arrow_back)),
                    Styles.bold(
                      "Cart",
                      fontSize: 16.sp,
                      color: black,
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: black,
                      size: 30,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 200.h),
              child: Container(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset("assets/images/empty-cart.png"),
                    ),
                    Styles.regular(
                      "Your have nothing here",
                      fontSize: 17.sp,
                      height: 2,
                      color: black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
