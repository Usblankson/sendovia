// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:planetx/modules/cart/view-cart.dart';

import '../../modules/home/home.dart';
import '../../modules/notification/notification.dart';

class BottomNavModel extends ChangeNotifier {
  ///current index of the bottom nav-bar
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  ///children of the bottom Nav
  List<Widget> _children = [
    HomeScreen(),
    Container(),
    NotificationScreen(),
    CartScreen(),

    // HistoryPage(),
    // Profile(),
  ];

  List<Widget> get children => _children;

  ///updates the current index of the bottom nav
  updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
