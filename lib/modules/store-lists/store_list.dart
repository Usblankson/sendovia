// ignore_for_file: unnecessary_import, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/models/categories_model.dart';
import 'package:planetx/shared/models/data.dart';
import 'package:planetx/shared/utils/styles.dart';

import '../../core/service_injector/service_injector.dart';
import '../../shared/utils/color.dart';
import '../../shared/widgets/base_view.dart';
import '../../modules/check-product/check_product.dart';
import '../home/viewmodel/product_vm.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

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
      //   backgroundColor: Color(0xffE5E5E5),
      body: Container(
        padding:
            EdgeInsets.only(top: 50.h, left: 24.w, right: 24.w, bottom: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    name: RoutePaths.storeProductScreen),
                              ),
                            ),
                        icon: Icon(Icons.arrow_back)),
                    Styles.bold(
                      "Send a gift",
                      fontSize: 16.sp,
                      color: black,
                    ),
                  ],
                ),
                Row(children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.grid_view_outlined)),
                ])
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 180.w,
                  child: InputDecorator(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'Budget',
                        isDense: true,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          // setState(() {
                          //   dropdownValue = newValue;
                          // });
                        },
                        items: <String>['Budget', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 180.w,
                  child: InputDecorator(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'Category',
                        isDense: true,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          // setState(() {
                          //   dropdownValue = newValue;
                          // });
                        },
                        items: viewModel.allCategories!
                            .map<DropdownMenuItem<String>>(
                                (PayloadFromCategories value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name!),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.separated(
                itemCount: viewModel.allProducts!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //   Navigator.push(
                      //   context,
                      //   MainRouter.generateRoute(
                      //     RouteSettings(name: RoutePaths.storeProductScreen),
                      //   ),
                      // );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckProductScreen(
                                productID: viewModel.allProducts![index].id!)),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 150.h,
                          width: 170.w,
                          child: Image.network(
                            viewModel.allProducts![index].image!,
                            fit: BoxFit.cover,
                            // fit: BoxFit.contain,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.star,
                            //       color: Color(0xffEAE419),
                            //     ),
                            //     Styles.regular(
                            //       storesLists[index].rating!,
                            //       fontSize: 16.sp,
                            //       color: Color(0xffEAE419),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(height: 5.h),
                            Styles.semiBold(
                              "${viewModel.allProducts![index].vendor!.firstName!} ${viewModel.allProducts![index].vendor!.lastName!}",
                              fontSize: 15.sp,
                              color: black,
                              height: 2,
                            ),
                            Styles.regular(
                              viewModel.allProducts![index].description!,
                              fontSize: 10.5.sp,
                              color: black,
                              height: 2,
                            ),
                            SizedBox(height: 20.h),
                            Styles.semiBold(
                              '\$${viewModel.allProducts![index].price!}',
                              fontSize: 14.sp,
                              color: black,
                              // height: 2,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
