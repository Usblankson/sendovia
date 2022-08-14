import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/modules-new/home_module/viewmodel/product_vm.dart';
import 'package:planetx/shared/models/allProducts_payload.dart';
import 'package:planetx/shared/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../shared/utils/color.dart';
import '../../shared/utils/navigation.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/space.dart';
import '../cart/gift_details_screen.dart';


class HomeProductDetailsBottomSheet extends StatelessWidget {
  const HomeProductDetailsBottomSheet({Key key, this.product, this.quantity, this.onRemove, this.onAdd}) : super(key: key);
  // final ProductViewModel viewModel;
  final PayloadFromProducts product;
  final int quantity;
  final Function() onRemove;
  final Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return homeProductDetailsBottomSheet(context, product: product );
  }

  homeProductDetailsBottomSheet(context,
      {PayloadFromProducts product}) {

        return Consumer<ProductViewModel>(
          builder: (context, viewModel, widget) {
            return Container(
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
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 32.h,
                                      width: 32.w,
                                      decoration: BoxDecoration(
                                          color: grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(8.r)),
                                      child: IconButton(
                                          icon: Icon(Icons.remove),
                                          iconSize: 16.sp,
                                          onPressed: onRemove),
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
                                          borderRadius: BorderRadius.circular(8.r)),
                                      child: IconButton(
                                          icon: Icon(Icons.add),
                                          iconSize: 16.sp,
                                          onPressed: onAdd
                                      ),
                                    ),
                                  ],
                                )
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
                                   var cart = await si.cartService.addToCart(product.id, quantity);
                                   debugPrint("see add to cart report ${cart.success}");
                                   if(cart.success) {
                                     showTopSnackBar(
                                         context,
                                         CustomSnackBar.success(
                                           message: cart.message,
                                         ));
                                     Navigator.pop(context);
                                   } else {
                                     showTopSnackBar(
                                         context,
                                         CustomSnackBar.error(
                                           message: cart.message,
                                         ));
                                   }
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Styles.semiBold(
                                        "Add to Cart",
                                        fontSize: 16.sp,
                                        color: primaryColor,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24.r),
                                        border: Border.all(color: grey, width: 1)),
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
            );
          }
        );

  }
}