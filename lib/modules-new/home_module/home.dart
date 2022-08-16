import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/modules-new/authentication/login.dart';
import 'package:planetx/modules-new/home_module/constants.dart';
import 'package:planetx/modules-new/home_module/viewmodel/product_vm.dart';
import 'package:planetx/modules-new/receiving_module/receiving_screen.dart';
import 'package:planetx/shared/models/allProducts_payload.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:planetx/shared/utils/navigation.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/base_view.dart';
import 'package:planetx/shared/widgets/custom_text_form_field.dart';
import 'package:planetx/shared/widgets/gift_notifiication_card.dart';
import 'package:planetx/shared/widgets/home_screen_top.dart';
import 'package:planetx/shared/widgets/loader.dart';
import 'package:planetx/shared/widgets/popular_item.dart';
import 'package:planetx/shared/widgets/scroll_cta_tag_widget.dart';
import 'package:planetx/shared/data/home_screen_lists.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:planetx/shared/widgets/space.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../shared/utils/color.dart';
import '../cart/gift_details_screen.dart';
import '../send_gift_module/send_gift.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      vmBuilder: (context) =>
          ProductViewModel(context: context, productService: si.productService),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ProductViewModel viewModel) {
    HomeList data = HomeList();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VSpace(4.h),
                homeScreenHeader(
                    context,
                    '${viewModel.authPayload.data.user.firstName ?? ""}',
                    viewModel.authPayload.data.user.profilePhoto),
                VSpace(24.h),
                Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Container(
                      height: 160.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText('Send gift with ease', 18.sp, FontWeight.w600,
                              white, 0.sp, 0.h, null),
                          VSpace(8.h),
                          AppText(
                              'Explore your gift horizon. begin to \nsend gifts easily without hassle.',
                              14.sp,
                              FontWeight.w400,
                              white,
                              0.sp,
                              0.h,
                              null),
                          VSpace(16.h),
                          Container(
                            width: 115.w,
                            height: 35.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: AppText('Send a gift', 14.sp,
                                FontWeight.w600, primaryColor, 0, 0.h, () {
                              sendGiftBottomModel(context, viewModel);
                            }),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8.0.r),
                        ),
                        child: Image.asset(
                          giftBox,
                          fit: BoxFit.cover,
                          width: 121.12.w,
                          height: 90.h,
                        ),
                      ),
                    ),
                  ],
                ),
                VSpace(16.h),
                CustomTextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  hintText: 'Search items',
                  controller: viewModel.searchController,
                  onSaved: () => viewModel.notify(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(search, width: 16.w, height: 16.h),
                  ),
                ),
                VSpace(24.h),
                viewModel.searchController.text.isEmpty 
                ? Column(
                  children: [
                    scrollActionTag(
                        context,
                        'Popular Items',
                        'See all',
                        SendGift(
                            tabControllerLength: viewModel.allCategories.length)),
                    SizedBox(
                      height: 160.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.allProducts.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          debugPrint(
                              "length of product ${viewModel.allProducts.length}");
                          // viewModel.quantityToPurchase = List.filled(index, 1);
                          return GestureDetector(
                            onTap: () async {
                              // return showModalBottomSheet(
                              return showModalBottomSheet(
                                  constraints: BoxConstraints.expand(
                                      height: (deviceHeight(context) * 0.73).sp),
                                  isDismissible: true,
                                  enableDrag: true,
                                  isScrollControlled: true,
                                  elevation: 5,
                                  barrierColor: Colors.grey.withOpacity(0.5),
                                  context: context,
                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                  builder: (BuildContext context) {
                                    Widget content = SizedBox();
                                    content = homeProductDetailsBottomSheet(
                                      // viewModel: viewModel,
                                      product: viewModel.allProducts[index],
                                      quantity: viewModel.quantityToPurchase[index],
                                    );
                                    viewModel.quantityToPurchase[index] = quantity;
                                    debugPrint(
                                        "lister ${viewModel.quantityToPurchase}");
                                    return content;
                                  });
                            },
                            child: popularItem(viewModel.allProducts[index].image,
                                viewModel.allProducts[index].name),
                          );
                        },
                      ),
                    ),
                    giftNotificationCard(
                        '${viewModel.authPayload.data.user.firstName ?? ""}',
                        'Deji', () {
                      Nav.forward(context, ReceivingScreen());
                    }),
                    scrollActionTag(
                        context,
                        'Categories',
                        'See all',
                        SendGift(
                            tabControllerLength: viewModel.allCategories.length)),
                    SizedBox(
                      height: 160.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.allCategories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              SendGift(
                                  tabControllerLength:
                                      viewModel.allCategories.length);
                            },
                            child: popularItem(viewModel.allCategories[index].image,
                                viewModel.allCategories[index].name),
                          );
                        },
                      ),
                    ),
                  ],
                )
                : Column(
                  children: [
                    VSpace(15.h),
                    viewModel.sortAllProducts.isEmpty
                    ? Center(child: Styles.regular("Search not found!"),)
                    : Column(
                      children: List.generate(viewModel.sortAllProducts.length, (index) => InkWell(
                        onTap: () {
                          return showModalBottomSheet(
                              constraints: BoxConstraints.expand(
                                  height: (deviceHeight(context) * 0.73).sp),
                              isDismissible: true,
                              enableDrag: true,
                              isScrollControlled: true,
                              elevation: 5,
                              barrierColor: Colors.grey.withOpacity(0.5),
                              context: context,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              builder: (BuildContext context) {

                                Widget content = SizedBox();
                                content = homeProductDetailsBottomSheet(
                                  // viewModel: viewModel,
                                  product: viewModel.sortAllProducts[index],
                                  quantity: viewModel.quantityToPurchase[index],
                                );
                                viewModel.quantityToPurchase[index] = quantity;
                                debugPrint(
                                    "lister ${viewModel.quantityToPurchase}");
                                return content;
                              });
                        },
                        child: SizedBox(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      viewModel.sortAllProducts[index].image,
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 100,
                                    ),
                                  ),
                                   HSpace(14.w),
                                  SizedBox(
                                    width: deviceWidth(context)/2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppText(viewModel.sortAllProducts[index].name,
                                            16.sp, FontWeight.w600, textColorDark, 0, 1.6, null),
                                        VSpace(8.w),
                                        AppText(viewModel.sortAllProducts[index].description,
                                            12.sp, FontWeight.w400, textColorDark, 0, 1.6, null),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              VSpace(15.h),
                            ],
                          ),
                        ),
                      )),
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

  sendGiftBottomModel(BuildContext context, viewModel) {
    return showModalBottomSheet(
      constraints: BoxConstraints.expand(height: deviceHeight(context) / 2),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      elevation: 5,
      barrierColor: Colors.grey.withOpacity(0.5),
      backgroundColor: Colors.grey.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text("Select a gift",
                      style: TextStyle(
                          color: Color(0xff5A67E7),
                          fontFamily: "PT Sans",
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w400)),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => Nav.forward(
                        context,
                        SendGift(
                          tabControllerLength: viewModel.allCategories.length,
                        )),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        child: Column(
                          children: [
                            Center(
                                child: Image.asset(
                              "assets/images/browse-gift.png",
                              height: 30.h,
                              width: 50.w,
                            )),
                            SizedBox(height: 10.h),
                            Styles.regular(
                              "Browse gift",
                              fontSize: 15.sp,
                              color: black,
                            ),
                            SizedBox(height: 10.h),
                            Styles.regular(
                              "Find something spectacular",
                              fontSize: 10.sp,
                              color: black,
                            ),
                          ],
                        ),
                      ),
                      height: 170.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                          color: Color(0xffD8DBFB),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      budgetBottomSheet(context);
                    },
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 35.h),
                        child: Column(
                          children: [
                            Center(
                                child: Image.asset(
                              "assets/images/send-gift.png",
                              height: 30,
                              width: 50,
                            )),
                            SizedBox(height: 10.h),
                            Styles.regular(
                              "Send a gift collection",
                              fontSize: 15.sp,
                              color: black,
                            ),
                            SizedBox(height: 10.h),
                            Styles.regular(
                              "Pick with a budget",
                              fontSize: 10.sp,
                              color: black,
                            ),
                          ],
                        ),
                      ),
                      height: 170,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffF4D3EB)),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget homeProductDetailsBottomSheet(
      {PayloadFromProducts product, int quantity}) {
    this.quantity = 1;
    bool isCartLoading = false;
    return StatefulBuilder(
        builder: (context, setState) => Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 202.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          image: product.image == null
                              ? AssetImage(bonton)
                              : NetworkImage(product.image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 9),
                            Styles.semiBold(
                              // viewModel.productInfo.name ?? "Airpods Pro Max",
                              product.name ?? "",
                              fontSize: 14.sp,
                              color: textColorDark,
                            ),
                            SizedBox(height: 9.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Styles.regular(
                                  product.description ?? "",
                                  //     "New AirPods Expected Later This \nYear as Suppliers Begin \nComponent ..",
                                  // "New AirPods Expected Later This \nYear as Suppliers Begin \nComponent ..",
                                  fontSize: 14.sp,
                                  color: grey,
                                ),
                                Styles.semiBold(
                                  // "\$ ${viewModel.productInfo.price.toString() ?? "00"}",
                                  "₦${product.price ?? "0"}",
                                  fontSize: 18.sp,
                                  color: textColorDark,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Styles.regular(
                                      "Colors",
                                      fontSize: 14.sp,
                                      color: grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Styles.regular(
                                  "Quantity",
                                  fontSize: 14.sp,
                                  color: grey,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 32.h,
                                      width: 32.w,
                                      decoration: BoxDecoration(
                                          color: grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: IconButton(
                                          icon: Icon(Icons.remove),
                                          iconSize: 16.sp,
                                          onPressed: () {
                                            setState(() {
                                              if (quantity > 1) {
                                                quantity--;
                                              }
                                            });
                                            this.quantity = quantity;
                                            debugPrint("minuser $quantity");
                                          }),
                                    ),
                                    HSpace(30.w),
                                    Styles.regular(
                                      // "${viewModel.quantityToPurchase}",
                                      "${quantity}",
                                      fontSize: 16.sp,
                                      color: quantity > 1 ? black : grey,
                                    ),
                                    HSpace(30.w),
                                    Container(
                                      height: 32.h,
                                      width: 32.w,
                                      decoration: BoxDecoration(
                                          color: grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: IconButton(
                                          icon: Icon(Icons.add),
                                          iconSize: 16.sp,
                                          onPressed: () {
                                            setState(() {
                                              quantity++;
                                            });
                                            this.quantity = quantity;
                                            debugPrint("adder $quantity");
                                          }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VSpace(16.h),
                            Divider(),
                            VSpace(16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      isCartLoading = true;
                                    });
                                    var cart = await si.cartService
                                        .addToCart(product.id, quantity);
                                    debugPrint(
                                        "see add to cart report ${cart.success} + quantity $quantity");
                                    if (cart.success) {
                                      setState(() {
                                        isCartLoading = false;
                                      });
                                      showTopSnackBar(
                                          context,
                                          CustomSnackBar.success(
                                            message: cart.message,
                                          ));
                                      // Navigator.pop(context);
                                    } else {
                                      setState(() {
                                        isCartLoading = false;
                                      });
                                      showTopSnackBar(
                                          context,
                                          CustomSnackBar.error(
                                            message: cart.message,
                                          ));
                                    }
                                  },
                                  child: Container(
                                    child: Center(
                                      child: isCartLoading
                                          ? Loader(
                                              radius: 20.r,
                                            )
                                          : Styles.semiBold(
                                              "Add to Cart",
                                              fontSize: 16.sp,
                                              color: primaryColor,
                                            ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(24.r),
                                        border:
                                            Border.all(color: grey, width: 1)),
                                    height: 55.h,
                                    width: 180.w,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      Nav.forward(context, GiftDetailScreen()),
                                  child: Container(
                                    height: 55.h,
                                    width: 180.w,
                                    child: Center(
                                      child: Styles.semiBold(
                                        "Send gift",
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.r),
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            VSpace(20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
