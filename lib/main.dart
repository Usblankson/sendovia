import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules/send_gift/add_message_screen.dart';
import 'package:planetx/router/app_router.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/dims.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

import 'core/locator/locator.dart';
import 'core/service_injector/service_injector.dart';
import 'modules/auth/login_first_user.dart';
import 'modules/auth/login_returning_user.dart';
import 'modules/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RouteObserverProvider(
    child: const MyApp(
      appKey: ValueKey<String>('root'),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({this.appKey}) : super(key: appKey);
  final ValueKey<String> appKey;

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  // bool _splashDone = false;
  @override
  void initState() {
    _init();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
      ),
    );

    // // The preferred screen orientation
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]).then((_) {});

    super.initState();
  }

  Future<void> _init() async {
    await si.init();

    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: Size(logicalWidth(), logicalHeight()),
      builder: () => MultiProvider(
          providers: allProviders,
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: MaterialColor(0xff7B61FF, <int, Color>{
                  50: Color(0xFFF3E5F5),
                  100: Color(0xFFE1BEE7),
                  200: Color(0xFF7E93D8),
                  300: Color(0xFF7A68C8),
                  400: Color(0xFF7B47BC),
                  500: Color(0xff7B61FF),
                  600: Color(0xFF8E24AA),
                  700: Color(0xFF7B1FA2),
                  800: Color(0xFF6A1B9A),
                  900: Color(0xFF4A148C),
                }),
                textTheme: TextTheme(
                    //To support the following, you need to use the first initialization method
                    button: TextStyle(fontSize: 45.sp)),
              ),
              onGenerateRoute: MainRouter.generateRoute,
              //  home: AddMessageScreen()),
              home: Splash())),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
