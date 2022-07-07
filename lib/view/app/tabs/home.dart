import 'package:flutter/material.dart';

import 'package:sendovia/utils/app_text.dart';
import 'package:sendovia/utils/colors.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';
import 'package:sendovia/widgets/gift_notifiication_card.dart';
import 'package:sendovia/widgets/popular_item.dart';

import '../../../utils/images.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List popularItems = [
    {
      'image': 'assets/images/samsung.png',
      'name': 'Phones',
    },
    {
      'image': 'assets/images/wrist-watch.png',
      'name': 'Wrist Watches',
    },
    {
      'image': 'assets/images/ear-bud.png',
      'name': 'Earbuds',
    },
    {
      'image': 'assets/images/smart-watch.png',
      'name': 'Smart Watches',
    }
  ];

  List categories = [
    {'image': 'assets/images/smart-watch.png', 'name': 'Tech'},
    {
      'image': 'assets/images/flower.png',
      'name': 'Flowers',
    },
    {
      'image': 'assets/images/sneakers.png',
      'name': 'Fashion',
    },
    {
      'image': 'assets/images/ear-bud.png',
      'name': 'Sound',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const YMargin(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            dp1,
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        const XMargin(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText('Hello', 14, FontWeight.w300,
                                supportTextColor, 0, 1.8, null),
                            AppText('Kingsley, 👋🏼', 14, FontWeight.w400,
                                textColor, 0, 1.8, null)
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        notification,
                        width: 32,
                        height: 32,
                      ),
                    )
                  ],
                ),
                const YMargin(24),
                Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Container(
                      height: 160,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText('Send gift with ease', 18, FontWeight.w600,
                              white, 0, 1.8, null),
                          const YMargin(8),
                          AppText(
                              'Explore your gift horizon. begin to \nsend gifts easily without hassle.',
                              14,
                              FontWeight.w400,
                              white,
                              0,
                              2,
                              null),
                          const YMargin(8 + 8),
                          Container(
                            width: 115,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: AppText('Send a gift', 14, FontWeight.w600,
                                primaryColor, 0, 2.4, null),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                        ),
                        child: Image.asset(
                          giftBox,
                          fit: BoxFit.cover,
                          width: 121.12,
                          height: 90,
                        ),
                      ),
                    ),
                  ],
                ),
                const YMargin(16),
                CustomTextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  hintText: 'Search items',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(search, width: 16, height: 16),
                  ),
                ),
                const YMargin(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppText('Popular Items', 14, FontWeight.w500, textColor, 0,
                        2, null),
                    AppText('See all', 12, FontWeight.w500, primaryColor, 0,
                        1.6, () {}),
                  ],
                ),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularItems.length,
                    itemBuilder: (context, index) {
                      return popularItem(popularItems[index]['image'],
                          popularItems[index]['name']);
                    },
                  ),
                ),
                giftNotificationCard('Kingsley', 'Deji'),
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppText('Categories', 14, FontWeight.w500, textColor, 0, 2,
                        null),
                    AppText('See all', 12, FontWeight.w500, primaryColor, 0,
                        1.6, () {}),
                  ],
                ),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return popularItem(categories[index]['image'],
                          categories[index]['name']);
                    },
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
