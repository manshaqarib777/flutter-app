import 'package:flutter/material.dart';
import 'package:gs_app/src/pages/login/login_screen.dart';

import '../../../config/app_colors.dart';
import 'onBoardingComponent.dart';

class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingComponent(
      backgroundColor: AppColors.primaryColor,
      labelColor: AppColors.bgBoarding,
      indicatorColor: AppColors.white,
      nextClick: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    );
  }
}
