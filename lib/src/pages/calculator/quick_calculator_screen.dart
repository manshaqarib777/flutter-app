import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gs_app/src/shared/app_card.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_string.dart';
import '../../shared/auth_top_bar.dart';
import '../dashboard/widgets/top_bar.dart';
import 'calculator_screen.dart';
class QuickCalculatorScreen extends StatefulWidget {
  const QuickCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<QuickCalculatorScreen> createState() => _QuickCalculatorScreenState();
}

class _QuickCalculatorScreenState extends State<QuickCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            children: [
              AppTopBar(
                  rightIcon: AppAssets.icBackArrow,
                  rightIconBgColor: AppColors.primaryColor,
                  toolbarLabel: AppStrings.calculator),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CalculatorScreen()));
                          },
                          child: AuthTopBar(
                            barVisibility: false,
                            textColor: AppColors.greyText,
                            title: AppStrings.calculator,
                          ),
                        )),
                    Expanded(
                        child: AuthTopBar(
                          title: AppStrings.quickCalculator,
                          barVisibility: true,
                          textColor: AppColors.primaryColor,

                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,),
                  child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: List.generate(10, (index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                        child: AppCard(Image.asset(AppAssets.appLogo)));

                  },),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
