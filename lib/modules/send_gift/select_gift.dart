// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules/send_gift/select_beneficiary.dart';
import 'package:planetx/modules/send_gift/viewmodel/sendgift_vm.dart';
import 'package:planetx/shared/models/cart_model.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/space.dart';
import '../../core/service_injector/service_injector.dart';
import '../../router/main_router.dart';
import '../../router/route_paths.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/base_view.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_button.dart';

class SelectGift extends StatelessWidget {
  List<PayloadFromCart> cartPayload;
  SelectGift({
    Key key,
    this.cartPayload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SendGiftViewModel>(
      vmBuilder: (context) => SendGiftViewModel(
          context: context, sendGiftService: si.sendGiftService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, SendGiftViewModel viewModel) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(deviceWidth(context), 64.0.h),
          child: CustomAppBar(
            backgroundColor: white,
            txtColor: black,
            title: "Select gift",
            height: 64.0.h,
            backBtn: true,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          width: deviceWidth(context),
          // height: deviceHeight(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: cartPayload.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: deviceWidth(context),
                      // height: 160.sp,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: lightPurple,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: kRed,
                              ),
                              HSpace(19.33.w),
                              Styles.regular("Select gift",
                                  fontSize: 14.sp, color: black),
                            ],
                          ),
                          VSpace(20.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 76.h,
                                    width: 75.w,
                                    decoration: BoxDecoration(
                                      color: grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: cartPayload[index].product.image !=
                                            null
                                        ? Image.network(
                                            cartPayload[index].product.image,
                                            fit: BoxFit.fill,
                                          )
                                        : Image.asset(
                                            "assets/images/store-product.png",
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                  HSpace(19.w),
                                  Container(
                                    height: 76.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Styles.bold(
                                              cartPayload[index]
                                                      .product
                                                      .name ??
                                                  "Airpods Pro",
                                              color: black,
                                              fontSize: 14.sp,
                                            ),
                                            VSpace(7.h),
                                            Styles.regular(
                                              "Quantity: ${cartPayload[index].quantity}",
                                              fontSize: 14.sp,
                                            ),
                                          ],
                                        ),
                                        Styles.regular(
                                            "\$${cartPayload[index].price}",
                                            fontSize: 20.sp,
                                            color: black),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Styles.regular("Change", color: primaryColor),
                            ],
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
              VSpace(24.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FlutterContactsExample(cartPayload: cartPayload)),
                  );
                },
                child: Container(
                  width: deviceWidth(context),
                  // height: 160.sp,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: lightPurple,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Styles.regular("Select beneficiary",
                                  fontSize: 14.sp, color: black),
                            ],
                          ),
                          Icon(
                            Icons.add,
                            color: black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              VSpace(24.h),
              CustomButton(
                  width: double.infinity.w,
                  height: 48.h,
                  isActive: true,
                  color: blue,
                  title: "Confirm",
                  onPress: () {
                    // Navigator.push(
                    //   context,
                    //   MainRouter.generateRoute(
                    //     RouteSettings(name: RoutePaths.s),
                    //   ),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FlutterContactsExample(
                                cartPayload: cartPayload,
                              )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
