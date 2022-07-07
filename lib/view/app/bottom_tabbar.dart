import 'package:flutter/material.dart';
import 'package:sendovia/utils/colors.dart';
import 'package:sendovia/view/app/tabs/home.dart';

import '../../utils/app_text.dart';
import '../../utils/images.dart';
import 'tabs/account.dart';
import 'tabs/history.dart';

class TabLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> with TickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);
  }

  List<Tab> tab() {
    return [
      Tab(
          icon: Image.asset(
            home,
            color: currentIndex == 0 ? primaryColor : supportTextColor,
            width: 24,
            height: 24,
          ),
          child: AppText('Home', 14, FontWeight.w400,
              currentIndex == 0 ? primaryColor : supportTextColor, 0, 0, null)),
      Tab(
          icon: Image.asset(
            history,
            color: currentIndex == 1 ? primaryColor : supportTextColor,
            width: 24,
            height: 24,
          ),
          child: AppText('History', 14, FontWeight.w400,
              currentIndex == 1 ? primaryColor : supportTextColor, 0, 0, null)),
      Tab(
          icon: Image.asset(
            cart,
            color: currentIndex == 2 ? primaryColor : supportTextColor,
            width: 24,
            height: 24,
          ),
          child: AppText('Cart', 14, FontWeight.w400,
              currentIndex == 2 ? primaryColor : supportTextColor, 0, 0, null)),
      Tab(
          icon: Image.asset(
            user,
            color: currentIndex == 3 ? primaryColor : supportTextColor,
            width: 24,
            height: 24,
          ),
          child: AppText(
              'Account',
              13,
              FontWeight.w500,
              currentIndex == 3 ? primaryColor : supportTextColor,
              0,
              3.2,
              null)),
    ];
  }

  static const List<Widget> _views = [
    Home(),
    History(),
    Center(child: Text('Content of Tab Three (Cart)')),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 16),
            ),
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: 38, vertical: 6),
            tabs: tab(),
            labelColor: primaryColor,
            unselectedLabelColor: supportTextColor,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(fontStyle: FontStyle.normal, color: supportTextColor),

            physics: const  BouncingScrollPhysics(),
            onTap: (int index) {
              currentIndex = index;
              setState(() {
                currentIndex = index;
              });
            },
            enableFeedback: true,
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
          ),
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
            children: _views,
          ),
        ),
      ),
    );
  }
}
