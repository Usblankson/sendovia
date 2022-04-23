// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';

class BottomNavModel extends ChangeNotifier {
  ///current index of the bottom nav-bar
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  ///children of the bottom Nav
  List<Widget> _children = [
    // HomePage(),
    // MyTimeSheet(),
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
