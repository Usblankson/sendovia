import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          constraints: BoxConstraints.expand(height: 390),
          isDismissible: true,
          enableDrag: true,
          isScrollControlled: true,
          elevation: 5,
          barrierColor: Colors.grey.withOpacity(0.5),
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Container(
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
                                  fontSize: 16.5,
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
                            onTap: () {
                              Navigator.pushNamed(context, "stores_lists");
                            },
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 35),
                                child: Column(
                                  children: [
                                    Center(
                                        child: Image.asset(
                                      "assets/images/browse-gift.png",
                                      height: 30,
                                      width: 50,
                                    )),
                                    SizedBox(height: 10),
                                    Text("Browse gift",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "PT Sans",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(height: 10),
                                    Text("Find something spectacular",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "PT Sans",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              height: 170,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: Color(0xffD8DBFB),
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 35),
                              child: Column(
                                children: [
                                  Center(
                                      child: Image.asset(
                                    "assets/images/send-gift.png",
                                    height: 30,
                                    width: 50,
                                  )),
                                  SizedBox(height: 10),
                                  Text("Send a gift collection",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "PT Sans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(height: 10),
                                  Text("pick with a budget",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "PT Sans",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            height: 170,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xffF4D3EB)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 52,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,

            end: Alignment.bottomCenter,
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              Color(0xff0C80E4),
              Color(0xffF304BE),
            ],
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/gift-box.png",
              height: 30,
              width: 50,
            ),
            Text("Send a gift",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PT Sans",
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
