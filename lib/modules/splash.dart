import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/router/main_router.dart';
import 'package:planetx/router/route_paths.dart';
import 'package:planetx/shared/utils/themes/theme.dart';
import 'package:planetx/shared/utils/utils.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  getPermissions() async {
    // var status = await Permission.storage.status;
    // if (!status.isGranted) {
    //   // We didn't ask for permission yet or the permission has been denied before but not permanently.
    //   PermissionStatus s = await Permission.storage.request();
    //   if (s.isGranted) {
    //     print("dls");
    //     Timer(
    //         Duration(seconds: 3),
    //         () => Navigator.push(
    //               context,
    //               MainRouter.generateRoute(
    //                 RouteSettings(name: RoutePaths.loginFirstUser),
    //               ),
    //             ));
    //   } else {
    //     //close app
    //     print("close app here");
    //   }
    // }

    Timer(
        Duration(seconds: 5),
            () => Navigator.push(
          context,
          MainRouter.generateRoute(
            RouteSettings(name: RoutePaths.signUp),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the 360*690(dp)
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: deviceWidth(context), maxHeight: deviceHeight(context)),
        designSize: Size(deviceWidth(context), deviceHeight(context)),
        orientation: Orientation.portrait);
    return Scaffold(
      body: Container(
        width: deviceWidth(context),
        height: deviceHeight(context),
        decoration: BoxDecoration(
          color: pmTheme.white,
          image: DecorationImage(image: AssetImage("assets/images/splash.png"))
        ),
        // child: Center(child: Image(image: ,)),
      ),
    );
  }
}
