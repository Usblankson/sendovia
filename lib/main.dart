import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendovia/utils/utils.dart';
import 'package:sendovia/view/authentication/splash.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(logicalWidth() == 0 ? 360.0 : logicalWidth(), logicalHeight() == 0 ? 772.0 : logicalHeight()),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _buildTheme(Brightness.dark),
          home: const SplashScreen(),
        );
      }
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    // textTheme: GoogleFonts.rubikTextTheme(baseTheme.textTheme),
    textTheme: const TextTheme(
      //To support the following, you need to use the first initialization method
      button: TextStyle(fontSize: 45)
  ),);
}
