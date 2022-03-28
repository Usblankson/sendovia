import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetx/core/view_model/bottom_nav_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/utils/color.dart';

class BottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav> {
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavModel>(
      builder: (context, model, child) => Scaffold(
        // key: _scaffoldKey,
        backgroundColor: white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0.75), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
              onTap: (index) => model.updateIndex(index),
              type: BottomNavigationBarType.fixed,
              elevation: 10,
              selectedLabelStyle: TextStyle(
                  color: primaryColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(
                  color: grey, fontSize: 10.sp, fontWeight: FontWeight.w600),
              backgroundColor: white,
              currentIndex: model.currentIndex,
              items: userBottomTabItems(context)),
        ),
        body: SafeArea(
            child: IndexedStack(
                index: model.currentIndex, children: model.children)),
      ),
    );
  }

  ///bottom nav items
  userBottomTabItems(BuildContext context) {
    return [
      new BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/images/bottom_nav_icons/Homex.png',
          height: 18.h,
          width: 18.w,
        ),
        icon: Image.asset(
          'assets/images/bottom_nav_icons/Home.png',
          height: 18.h,
          width: 18.w,
        ),
        label: "Home",
      ),
      new BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/images/bottom_nav_icons/Document.png',
          height: 18.h,
          width: 18.w,
        ),
        icon: Image.asset(
          'assets/images/bottom_nav_icons/Documentx.png',
          height: 18.h,
          width: 18.w,
        ),
        label: "Timesheet",
      ),
      new BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/images/bottom_nav_icons/Building.png',
          height: 18.h,
          width: 18.w,
        ),
        icon: Image.asset(
          'assets/images/bottom_nav_icons/Buildingx.png',
          height: 18.h,
          width: 18.w,
        ),
        label: "History",
      ),
      new BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/images/bottom_nav_icons/Profile.png',
          height: 18.h,
          width: 18.w,
        ),
        icon: Image.asset(
          'assets/images/bottom_nav_icons/Profilex.png',
          height: 18.h,
          width: 18.w,
        ),
        label: "Profile",
      ),
    ];
  }
}
