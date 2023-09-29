import 'package:flutter/material.dart';
import 'package:gs_app/config/app_colors.dart';

import 'onBoardingComponent.dart';
import 'onBoardingScreen3.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingComponent(
      backgroundColor: AppColors.white,
      labelColor: AppColors.primaryColor,
      indicatorColor: AppColors.bgBoarding,
      nextClick: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardingScreen3()));
      },
    );
  }
}
