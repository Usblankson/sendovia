// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/core/service_injector/service_injector.dart';
import 'package:planetx/modules-new/home_module/viewmodel/product_vm.dart';
import 'package:planetx/shared/models/data.dart';
import 'package:planetx/shared/utils/styles.dart';
import 'package:planetx/shared/widgets/floating_button.dart';

import '../../shared/utils/color.dart';
import '../../shared/widgets/base_view.dart';
import '../../modules/check-product/check_product.dart';

class HomeScreen extends StatelessWidget {
  // final List<PopularImages>? popularImages;
  const HomeScreen({
    Key key,
  }) : super(key: key);

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
      floatingActionButton: FAB(),
      //  backgroundColor: Color(0xffE5E5E5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const CircleAvatar(),
                      const SizedBox(width: 14),
                      const Text("Hi Joe",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "PT Sans",
                              fontSize: 17,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(width: 10),
                      Container(
                        child: Center(
                          child: Text("\$12.50",
                              style: TextStyle(
                                  color: Color(0xffF304BE),
                                  fontFamily: "Epilogue",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                        height: 30,
                        width: 65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Color(0xff0B72D2), width: 0.5)),
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/images/sendovia_logo.png",
                    height: 40,
                    width: 90,
                  )
                ],
              ),
              SizedBox(height: 26),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.search, color: grey),
                      SizedBox(width: 16),
                      Text("Search items or services",
                          style: TextStyle(
                              color: Color(0xff9D9D9D),
                              fontFamily: "Epilogue",
                              fontSize: 12,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Color(0xffF6F6F6)),
                height: 45,
                width: double.infinity,
              ),
              SizedBox(height: 24),
              headingRow(title: "Popular", subTitle: "see all"),
              SizedBox(height: 14),
              Popular(
                viewModel: viewModel,
              ),
              SizedBox(height: 26),
              headingRow(title: "Categories", subTitle: "see all"),
              SizedBox(height: 14),
              Popular(
                viewModel: viewModel,
              ),
              SizedBox(height: 40),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                          "Explore your gift horizon. begin to send \n\ngifts easily without hassle.",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "PT Sans",
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/explore-gift.png',
                      ),
                      fit: BoxFit.cover),
                ),
                //  color: Colors.red,
                height: 250,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Popular extends StatelessWidget {
  ProductViewModel viewModel;
  VoidCallback onTap;
  Popular({
    Key key,
    this.viewModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: GridView.count(
        // shrinkWrap: ,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 9.0,
        children: List.generate(
          viewModel.allProducts.length,
          (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckProductScreen(
                          productID: viewModel.allProducts[index].id)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: Column(
                  children: [
                    Image.network(
                      viewModel.allProducts[index].image,
                      fit: BoxFit.cover,
                      // fit: BoxFit.contain,
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      child: Text(viewModel.allProducts[index].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "PT sans",
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400)),
                      width: 60.w,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Row headingRow({
  String title,
  String subTitle,

  //  required VoidCallback onTapped
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 14,
            color: black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontFamily: 'PT Sans'),
      ),
      InkWell(
        onTap: () {},
        child: Text(
          subTitle,
          style: const TextStyle(
              fontSize: 14,
              color: secondaryBlue,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontFamily: 'PT Sans'),
        ),
      ),
    ],
  );
}
