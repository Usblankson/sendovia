// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:planetx/modules/my_account/my_account.module.dart';
import 'package:planetx/router/route_composer.dart';
import 'package:planetx/shared/models/route_model.dart';

class AppModule {
  AppModule();

  static final List<RouteOption> routes = <RouteOption>[
    RouteOption(
      path: '',
      // builder: (BuildContext context,
      //     AjanuwRouting<Object> r) {
      //   // typical page not found example
      //   return Container(
      //     child: const Text('Page not found'),
      //   );
      // },
    ),

    /// Example
    ...RouteComposer.compose(
      'account',
      MyAccountModule.routes,
    ),
    // Add other route modules here
  ];
}
