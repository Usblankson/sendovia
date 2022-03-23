import 'package:flutter/material.dart';
import 'package:planetx/modules/auth/login_first_user.dart';
import 'package:planetx/modules/onBoarding/signup_user.dart';
import 'package:planetx/modules/splash.dart';
import 'package:planetx/router/route_paths.dart';

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
