import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetx/shared/models/data.dart';

import '../../shared/utils/color.dart';

class StoresLists extends StatelessWidget {
  const StoresLists({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Budget';
    String categories = 'Category';

    // List of items in our dropdown menu
    var items = [
      'Budget',
      'below- ₦1,000',
      '₦1,000 - ₦5,000',
      '₦5,000 - ₦10,000',
      '₦10,000 - ₦20, 000',
      '₦20,000 - ₦50, 000'
    ];
    var categoriesItems = [
      'Category',
      'Home',
      'Fitness',
      'Tech',
      'Flowers',
    ];
    return Scaffold(
      //   backgroundColor: Color(0xffE5E5E5),
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
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.grid_view_outlined)),
                      SizedBox(height: 30),
                    ])
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(
                                color: primaryGrey.withOpacity(0.5),
                                width: 0.5)),
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          hint: Text("data"),
                          isExpanded: true, dropdownColor: white,
                          // underline: Divider(
                          //   color: black,
                          //   height: 0.001,
                          // ),
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryGrey,
                          ),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: "PT Sans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(
                                color: primaryGrey.withOpacity(0.5),
                                width: 0.5)),
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          hint: Text("data"),
                          isExpanded: true, dropdownColor: white,
                          // underline: Divider(
                          //   color: black,
                          //   height: 0.001,
                          // ),
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryGrey,
                          ),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: "PT Sans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  itemCount: storesLists.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "store_product_screen");
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                // decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //         image: AssetImage(
                                //             storesLists[index].image),
                                //         fit: BoxFit.contain)),
                                height: 150,
                                width: 170,
                                child: Image.asset(
                                  storesLists[index].image,
                                  fit: BoxFit.cover,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffEAE419),
                                        ),
                                        Text(storesLists[index].rating,
                                            style: TextStyle(
                                                color: Color(0xffEAE419),
                                                fontFamily: "PT Sans",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(storesLists[index].storeName,
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: "PT Sans",
                                        fontSize: 14,
                                        height: 2,
                                        fontWeight: FontWeight.w500)),
                                Text(storesLists[index].description,
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: "PT Sans",
                                        fontSize: 10,
                                        height: 2,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 20),
                                Text(storesLists[index].price,
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: "PT Sans",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
