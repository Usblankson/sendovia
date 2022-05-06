import 'package:flutter/material.dart';
import 'package:planetx/modules/auth/login_first_user.dart';
import 'package:planetx/modules/onBoarding/signup_user.dart';
import 'package:planetx/modules/splash.dart';
import 'package:planetx/router/route_paths.dart';

import '../modules/app_module/layout/bottom_nav.dart';
import '../modules/auth/validate_auth.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case RoutePaths.signUp:
        return MaterialPageRoute(builder: (_) => SignUpUser());
    case RoutePaths.validateAuth:
        return MaterialPageRoute(builder: (_) => const ValidateAuth());
     case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginFirstUser());
     case RoutePaths.bottomNav:
        return MaterialPageRoute(builder: (_) => BottomNav());
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
