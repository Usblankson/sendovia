import 'package:flutter/material.dart';
import 'package:planetx/modules/auth/login_first_user.dart';
import 'package:planetx/modules/check-product/check_product.dart';
import 'package:planetx/modules/onBoarding/signup_user.dart';
import 'package:planetx/modules/splash.dart';
import 'package:planetx/modules/store-lists/store_list.dart';
import 'package:planetx/modules/store-product/store_product.dart';
import 'package:planetx/router/route_paths.dart';

import '../modules/home/home.dart';
import '../modules/send_gift/summary_screen.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => Splash());
        break;
      case RoutePaths.signUp:
        return MaterialPageRoute(builder: (_) => SignUpUser());
        break;
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => LoginFirstUser());
        break;
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case RoutePaths.summaryScreen:
        return MaterialPageRoute(builder: (_) => SummaryScreen());
        break;
      case RoutePaths.checkProduct:
        return MaterialPageRoute(builder: (_) => CheckProductScreen());
        break;
      case RoutePaths.storesList:
        return MaterialPageRoute(builder: (_) => StoresLists());
        break;
      case RoutePaths.storeProduct:
        return MaterialPageRoute(builder: (_) => StoreProductScreen());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
