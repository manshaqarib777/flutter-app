import 'package:flutter/material.dart';
import 'package:gs_app/src/pages/onBoarding/onBoardingScreen2.dart';

import '../../../config/app_colors.dart';
import 'onBoardingComponent.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingComponent(
      backgroundColor: AppColors.bgBoarding,
      labelColor: AppColors.white,
      indicatorColor: AppColors.primaryColor,
      nextClick: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardingScreen2()));
      },
    );
  }
}
