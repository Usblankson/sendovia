import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/modules-new/cart/cart_screen.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/shared/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

import 'core/locator/locator.dart';
import 'core/service_injector/service_injector.dart';
import 'modules-new/cart/gift_details_screen.dart';
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
  final ValueKey<String>? appKey;

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
      builder: (context, child) => MultiProvider(
        providers: allProviders,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.green,
              textTheme: TextTheme(
                  //To support the following, you need to use the first initialization method
                  button: TextStyle(fontSize: 45.sp)),
            ),
            onGenerateRoute: MainRouter.generateRoute,
            home: GiftDetailScreen()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
