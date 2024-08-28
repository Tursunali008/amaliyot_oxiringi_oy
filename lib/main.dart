import 'package:amaliyot_oxiringi_oy/core/themes/app_themes.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/splash/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Amaliyot oxiringi oy',
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        home: const WelcomeScreen(),
      ),
    );
  }
}
