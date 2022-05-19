import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:planetx/shared/models/themes.dart';
import 'package:planetx/shared/widgets/button.dart';

class CheckProductScreen extends StatelessWidget {
  const CheckProductScreen({Key? key, productID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 290,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/store-product.png",
                          ),
                          fit: BoxFit.cover)),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Airpods",
                              style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontFamily: "PT Sans",
                                  fontSize: 16,
                                  height: 3,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 9),
                          Text("Airpods Pro Max",
                              style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontFamily: "PT Sans",
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 9),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "New AirPods Expected Later This \nYear as Suppliers Begin \nComponent ..",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "PT Sans",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              Text("\$3,0000",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "PT Sans",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Colors",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "PT Sans",
                                          fontSize: 16,
                                          //   height: 3,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  //   SizedBox(width: 40),
                                  Container(
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Image.asset("assets/images/white.png",
                                              height: 35),
                                          Text("White",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "PT Sans",
                                                  fontSize: 14,
                                                  //        height: 3,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    height: 40,
                                    width: 125,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: Color(0xff0B72D2),
                                            width: 0.5)),
                                  ),
                                  SizedBox(width: 30),
                                  Image.asset("assets/images/black.png",
                                      height: 35),
                                  Text("Black",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "PT Sans",
                                          fontSize: 14,
                                          //        height: 3,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 280),
                            child: Button(
                              widget: null,
                              text: 'Select gift',
                              width: double.infinity,
                              height: 58,
                              color: primaryColor,
                              onPressed: () {},
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text("Discard",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: "PT Sans",
                                      fontSize: 16,
                                      height: 3,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
