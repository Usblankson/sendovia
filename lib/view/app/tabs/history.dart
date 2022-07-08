import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendovia/widgets/history_card_widget.dart';

import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/space.dart';
import '../data/home_screen_lists.dart';

class History extends StatefulWidget {
  const History({Key key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  HomeList list = HomeList();

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: black,
            shadowColor: appbarShadowColor.withOpacity(0.1),
            toolbarHeight: Platform.isAndroid ? 70.h : 50.h,
            toolbarOpacity: 0.5,
            backgroundColor: white,
            elevation: 0,
            bottomOpacity: 0.1,
            title: AppText(
              'History',
              20.sp,
              FontWeight.w500,
              textColor,
              0,
              0,
              null,
            ),
            actions: [
              Container(
                width: 80.w,
                height: 35.h,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: inputFieldColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Image.asset(filter, width: 13.w, height: 12.32.h),
                    HSpace(8.w),
                    AppText(
                      'Filter',
                      14.sp,
                      FontWeight.w400,
                      textColor,
                      0,
                      0,
                      null,
                    ),
                  ],
                ),
              ),
            ],
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
            Container(
              color: white,
              child: TabBar(
                labelColor: textColor,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.5.w,
                    color: primaryColor,
                  ),
                ),
                unselectedLabelColor: supportTextColor,
                tabs: [
                  Tab(
                      child: AppText(
                          "Sent", 16.sp, FontWeight.w400, null, 0, 1.6.h, null)),
                  Tab(
                      child: AppText("Received", 16.sp, FontWeight.w400, null,
                          0, 1.6.h, null)),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                SizedBox(
                  height: 400.h,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: list.sentHistory.length,
                      itemBuilder: (context, index) {
                        return historyCard(
                          context,
                            list.sentHistory[index]['from'],
                            list.sentHistory[index]['image'],
                            list.sentHistory[index]['name'],
                            list.sentHistory[index]['date'],
                            list.sentHistory[index]['recipient'],
                            list.sentHistory[index]['price'],
                            list.sentHistory[index]['status'],
                            );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 400.h,
                  child: Padding(
                    padding: EdgeInsets.only(top:20.h),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: list.receivedHistory.length,
                      itemBuilder: (context, index) {
                        return historyCard(
                          context,
                            list.receivedHistory[index]['from'],
                            list.receivedHistory[index]['image'],
                            list.receivedHistory[index]['name'],
                            list.receivedHistory[index]['date'],
                            list.receivedHistory[index]['recipient'],
                            list.receivedHistory[index]['price'],
                            list.receivedHistory[index]['status'],
                            );
                      },
                    ),
                  ),
                ),
            
                // Container(
                //   padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                //   child: ListView(
                //     children: [],
                //   ),
                // ),
              ]),
            )
          ]),
        ));
  }
}
