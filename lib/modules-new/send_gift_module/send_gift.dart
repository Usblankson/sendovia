import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/modules-new/home_module/constants.dart';
import 'package:planetx/modules-new/home_module/viewmodel/product_vm.dart';
import 'package:planetx/modules-new/send_gift_module/shop_details.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/widgets/base_view.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:planetx/shared/widgets/gift_item_widget.dart';
import 'package:planetx/shared/data/home_screen_lists.dart';

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

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      vmBuilder: (context) =>
          ProductViewModel(context: context, productService: si.productService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ProductViewModel viewModel) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          shadowColor: appbarShadowColor.withOpacity(0.1),
          toolbarHeight: Platform.isAndroid ? 70.h : 50.h,
          toolbarOpacity: 0.5,
          backgroundColor: white,
          elevation: 1,
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
              "Send a gift", 18.sp, FontWeight.w600, textColorDark, 0, 0, null),
          // actions: [
          //   IconButton(
          //       icon: Image.asset(
          //         search,
          //         width: 15.64.w,
          //         height: 18.02.h,
          //       ),
          //       onPressed: () {}),
          // ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () {
                  budgetBottomSheet(context);
                },
                child: CustomTextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  isEnabled: false,
                  hintText: 'Select Budget',
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 32,
                    color: darkBlueColor,
                  ),
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
                      EdgeInsets.symmetric(horizontal: 0.w, vertical: 2.h),
                  unselectedLabelColor: supportTextColor,

                  //  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: primaryColor.withOpacity(0.1)),
                  // isScrollable: true,
                  tabs: List.generate(
                    viewModel.allCategories.length,
                    (index) {
                      return Tab(
                        child: Container(
                          height: 32.h,
                          width: 57.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
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
                      );
                    },
                  ),
                  // tabs: [
                  //   Tab(
                  //     child: Container(
                  //       height: 32.h,
                  //       width: 57.w,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: AppText(
                  //         "All",
                  //         12.sp,
                  //         FontWeight.w400,
                  //         null,
                  //         0,
                  //         1.6.h,
                  //         null,
                  //       ),
                  //     ),
                  //   ),
                  //   Tab(
                  //     child: Container(
                  //       height: 32.h,
                  //       width: 57.w,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: AppText(
                  //         "Home",
                  //         12.sp,
                  //         FontWeight.w400,
                  //         null,
                  //         0,
                  //         1.6.h,
                  //         null,
                  //       ),
                  //     ),
                  //   ),
                  //   Tab(
                  //     child: Container(
                  //       height: 32.h,
                  //       width: 58.w,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: AppText(
                  //         "Fitness",
                  //         12.sp,
                  //         FontWeight.w400,
                  //         null,
                  //         0,
                  //         1.6.h,
                  //         null,
                  //       ),
                  //     ),
                  //   ),
                  //   Tab(
                  //     child: Container(
                  //       height: 32.h,
                  //       width: 57.w,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: AppText(
                  //         "Tech",
                  //         12.sp,
                  //         FontWeight.w400,
                  //         null,
                  //         0,
                  //         1.6.h,
                  //         null,
                  //       ),
                  //     ),
                  //   ),
                  //   Tab(
                  //     child: Container(
                  //       height: 32.h,
                  //       width: 57.w,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: AppText(
                  //         "Food",
                  //         12.sp,
                  //         FontWeight.w400,
                  //         null,
                  //         0,
                  //         1.6.h,
                  //         null,
                  //       ),
                  //     ),
                  //   ),
                  //   Tab(
                  //     child: Container(
                  //       height: 32.h,
                  //       width: 57.w,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: AppText(
                  //         "Flowers",
                  //         12.sp,
                  //         FontWeight.w400,
                  //         null,
                  //         0,
                  //         1.6.h,
                  //         null,
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children:
                      List.generate(viewModel.allCategories.length, (index) {
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: list.allGifts.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Nav.forward(context, ShopDetailsScreen());
                        },
                        child: giftItem(
                          context,
                          list.allGifts[index]['image'],
                          list.allGifts[index]['name'],
                          list.allGifts[index]['desc'],
                          list.allGifts[index]['rating'],
                          list.allGifts[index]['reviews'],
                          list.allGifts[index]['price'],
                        ),
                      ),
                    );
                  }),

                  // [
                  //   GridView.builder(
                  //     physics: const BouncingScrollPhysics(),
                  //     itemCount: list.allGifts.length,
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       mainAxisExtent: 250,
                  //     ),
                  //     itemBuilder: (_, index) => GestureDetector(
                  //       onTap: () {
                  //         Nav.forward(context, ShopDetailsScreen());
                  //       },
                  //       child: giftItem(
                  //         context,
                  //         list.allGifts[index]['image'],
                  //         list.allGifts[index]['name'],
                  //         list.allGifts[index]['desc'],
                  //         list.allGifts[index]['rating'],
                  //         list.allGifts[index]['reviews'],
                  //         list.allGifts[index]['price'],
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ),
              )
            ])));
  }
}
