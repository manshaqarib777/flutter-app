import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gs_app/src/pages/calculator/calculator_screen.dart';
import 'package:gs_app/src/pages/calculator/quick_calculator_screen.dart';
import 'package:gs_app/src/pages/dashboard/dashboard_screen.dart';
import 'package:gs_app/src/pages/forgetPassword/forget_password_screen.dart';
import 'package:gs_app/src/pages/forgetPassword/verification_code_screen.dart';
import 'package:gs_app/src/pages/login/login_screen.dart';
import 'package:gs_app/src/pages/onBoarding/onBoardingComponent.dart';
import 'package:gs_app/src/pages/onBoarding/onBoardingScreen2.dart';
import 'package:gs_app/src/pages/onBoarding/onBoardingScreen1.dart';
import 'package:gs_app/src/pages/onBoarding/onBoardingScreen3.dart';
import 'package:gs_app/src/pages/register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
         return MaterialApp(
           builder: FlutterSmartDialog.init(),
            debugShowCheckedModeBanner: false,
            home:  QuickCalculatorScreen(),
          );
        },

      ),
    );
  }
}




