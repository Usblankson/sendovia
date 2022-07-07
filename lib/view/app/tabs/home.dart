import 'package:flutter/material.dart';

import 'package:sendovia/utils/app_text.dart';
import 'package:sendovia/utils/colors.dart';
import 'package:sendovia/utils/spacing.dart';
import 'package:sendovia/view/authentication/login.dart';
import 'package:sendovia/widgets/custom_text_form_field.dart';
import 'package:sendovia/widgets/gift_notifiication_card.dart';
import 'package:sendovia/widgets/home_screen_top.dart';
import 'package:sendovia/widgets/popular_item.dart';
import 'package:sendovia/widgets/scroll_cta_tag_widget.dart';

import '../../../utils/images.dart';
import '../data/home_screen_lists.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeList data = HomeList();
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
                homeScreenHeader(context, 'Kingsley'),
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
                          const YMargin(16),
                          Container(
                            width: 115,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: AppText('Send a gift', 14, FontWeight.w600,
                                primaryColor, 0, 2.4, () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  backgroundColor: primaryColor, 
                                content: const Text(
                                    "Please add add the send gift route on line 79"),
                              ));
                            }),
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
                scrollActionTag(
                    context, 'Popular Items', 'See all', const LogIn()),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.popularItems.length,
                    itemBuilder: (context, index) {
                      return popularItem(data.popularItems[index]['image'],
                          data.popularItems[index]['name']);
                    },
                  ),
                ),
                giftNotificationCard('Kingsley', 'Deji'),
                scrollActionTag(
                    context, 'Categories', 'See all', const LogIn()),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.categories.length,
                    itemBuilder: (context, index) {
                      return popularItem(data.categories[index]['image'],
                          data.categories[index]['name']);
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
