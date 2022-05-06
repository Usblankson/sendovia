import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetx/shared/models/data.dart';
import 'package:planetx/shared/models/themes.dart';

class StoreProductScreen extends StatelessWidget {
  const StoreProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        Text("Send a gift",
                            style: TextStyle(
                                color: black,
                                fontFamily: "PT Sans",
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Row(children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      SizedBox(height: 30),
                    ])
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/store-product.png",
                          ),
                          fit: BoxFit.cover)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Top Tek',
                            style: TextStyle(
                                color: black,
                                fontFamily: "PT Sans",
                                fontSize: 20,
                                height: 2,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text:
                                '\ntoptek stores specialize in top \nquality bluetooth technology  ',
                            style: TextStyle(
                                color: primaryGrey,
                                fontFamily: "PT Sans",
                                fontSize: 14,
                                height: 2,
                                fontWeight: FontWeight.w400)),
                      ],
                    )),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text("5.0 (20)",
                            style: TextStyle(
                                color: secondaryGrey,
                                fontFamily: "PT Sans",
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
                ListView.separated(
                  itemCount: storesProductLists.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "check_prouduct");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 70,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              // child:
                              //     Image.asset(storesProductLists[index].image),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(storesProductLists[index].storeName!,
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: "PT Sans",
                                        fontSize: 14,
                                        height: 2,
                                        fontWeight: FontWeight.w500)),
                                Text(storesProductLists[index].description!,
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: "PT Sans",
                                        fontSize: 10,
                                        height: 2,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 20),
                              ],
                            ),
                            Text(
                              storesProductLists[index].price!,
                              style: TextStyle(
                                  color: black,
                                  fontFamily: "PT Sans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 15);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
