import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/data/home_screen_lists.dart';
import 'package:planetx/modules-new/utils/app_text.dart';
import 'package:planetx/modules-new/utils/colors.dart';
import 'package:planetx/modules-new/utils/images.dart';
import 'package:planetx/modules-new/utils/navigation.dart';
import 'package:planetx/modules-new/widgets/custom_text_form_field.dart';
import 'package:planetx/modules-new/widgets/gift_item_widget.dart';


class SendGift extends StatefulWidget {
  const SendGift({Key key}) : super(key: key);

  @override
  State<SendGift> createState() => _SendGiftState();
}

class _SendGiftState extends State<SendGift> 
 with SingleTickerProviderStateMixin {

  HomeList list = HomeList();
   TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        shadowColor: appbarShadowColor.withOpacity(0.1),
        toolbarHeight: Platform.isAndroid ? 70.h : 50.h,
        toolbarOpacity: 0.5,
        backgroundColor: white,
        elevation: 0,
        bottomOpacity: 0.1,
        leading: IconButton(
            icon: Image.asset(
              backBtn,
              width: 24.w,
              height: 24.h,
            ),
            onPressed: () {
              Nav.back(context);
            }),
        title: AppText(
            "Send a gift", 18.sp, FontWeight.w600, textColor, 0, 0, null),
        actions: [
          IconButton(
              icon: Image.asset(
                search,
                width: 15.64.w,
                height: 18.02.h,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(

        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              keyboardType: TextInputType.text,
              maxLines: 1,
              hintText: 'Select Budget',
              suffixIcon: Icon(
                Icons.arrow_drop_down_rounded,
                size: 32,
                color: darkBlueColor,
              ),
            ),
             Padding(
               padding: EdgeInsets.symmetric(vertical: 12.h),
               child: TabBar(
                  controller: _tabController,
                         isScrollable: true,
                         labelPadding:
                             EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
                         labelColor: primaryColor,
                         indicatorPadding:
                             EdgeInsets.symmetric(horizontal: 0.w, vertical: 2),
                         unselectedLabelColor: supportTextColor,
             
                         //  indicatorSize: TabBarIndicatorSize.label,
                         indicator: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             color: primaryColor.withOpacity(0.1)),
                         // isScrollable: true,
                         tabs: [
                           Tab(
                             child: Container(
                               height: 32.h,
                               width: 57.w,
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: AppText(
                                 "All",
                                 12.sp,
                                 FontWeight.w400,
                                 null,
                                 0,
                                 1.6.h,
                                 null,
                               ),
                             ),
                           ),
                           Tab(
                             child: Container(
                               height: 32.h,
                               width: 57.w,
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: AppText(
                                 "Home",
                                 12.sp,
                                 FontWeight.w400,
                                 null,
                                 0,
                                 1.6.h,
                                 null,
                               ),
                             ),
                           ),
                            Tab(
                             child: Container(
                               height: 32.h,
                               width: 58.w,
                               alignment: Alignment.center,
                              
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: AppText(
                                 "Fitness",
                                 12.sp,
                                 FontWeight.w400,
                                 null,
                                 0,
                                 1.6.h,
                                 null,
                               ),
                             ),
                           ),
                           Tab(
                             child: Container(
                               height: 32.h,
                               width: 57.w,
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: AppText(
                                 "Tech",
                                 12.sp,
                                 FontWeight.w400,
                                 null,
                                 0,
                                 1.6.h,
                                 null,
                               ),
                             ),
                           ),
                            Tab(
                             child: Container(
                               height: 32.h,
                               width: 57.w,
                               alignment: Alignment.center,
                              
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: AppText(
                                 "Food",
                                 12.sp,
                                 FontWeight.w400,
                                 null,
                                 0,
                                 1.6.h,
                                 null,
                               ),
                             ),
                           ),
                            Tab(
                             child: Container(
                               height: 32.h,
                               width: 57.w,
                               alignment: Alignment.center,
                             
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: AppText(
                                 "Flowers",
                                 12.sp,
                                 FontWeight.w400,
                                 null,
                                 0,
                                 1.6.h,
                                 null,
                               ),
                             ),
                           ),
                         ]
                         ),
             ),
        
         Expanded(
           child: TabBarView(
            controller: _tabController,
            children: [
             
                GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.allGifts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
            itemBuilder: (_, index) => giftItem(context,
            list.allGifts[index]['image'],
            list.allGifts[index]['name'],
            list.allGifts[index]['desc'],
            list.allGifts[index]['rating'],
            list.allGifts[index]['reviews'],
            list.allGifts[index]['price'],
            ),
          ),
                GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.allGifts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
            itemBuilder: (_, index) => giftItem(context,
            list.allGifts[index]['image'],
            list.allGifts[index]['name'],
            list.allGifts[index]['desc'],
            list.allGifts[index]['rating'],
            list.allGifts[index]['reviews'],
            list.allGifts[index]['price'],
            ),
          ),
                GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.allGifts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
            itemBuilder: (_, index) => giftItem(context,
            list.allGifts[index]['image'],
            list.allGifts[index]['name'],
            list.allGifts[index]['desc'],
            list.allGifts[index]['rating'],
            list.allGifts[index]['reviews'],
            list.allGifts[index]['price'],
            ),
          ),
                GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.allGifts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
            itemBuilder: (_, index) => giftItem(context,
            list.allGifts[index]['image'],
            list.allGifts[index]['name'],
            list.allGifts[index]['desc'],
            list.allGifts[index]['rating'],
            list.allGifts[index]['reviews'],
            list.allGifts[index]['price'],
            ),
          ),
                GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.allGifts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
            itemBuilder: (_, index) => giftItem(context,
            list.allGifts[index]['image'],
            list.allGifts[index]['name'],
            list.allGifts[index]['desc'],
            list.allGifts[index]['rating'],
            list.allGifts[index]['reviews'],
            list.allGifts[index]['price'],
            ),
          ),
                GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.allGifts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
            itemBuilder: (_, index) => giftItem(context,
            list.allGifts[index]['image'],
            list.allGifts[index]['name'],
            list.allGifts[index]['desc'],
            list.allGifts[index]['rating'],
            list.allGifts[index]['reviews'],
            list.allGifts[index]['price'],
            ),
          ),
             
              
                
              
            ]
            ),
         )
        
      
      
        ])));
  }
}
