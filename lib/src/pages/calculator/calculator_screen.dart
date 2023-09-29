import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gs_app/config/app_assets.dart';
import 'package:gs_app/config/app_colors.dart';
import 'package:gs_app/config/app_string.dart';
import 'package:gs_app/src/pages/calculator/quick_calculator_screen.dart';
import 'package:gs_app/src/pages/dashboard/widgets/top_bar.dart';

import '../../shared/app_button.dart';
import '../../shared/app_card.dart';
import '../../shared/auth_top_bar.dart';
import '../../shared/input_text.dart';
import '../dashboard/widgets/card_label.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  InputText tfCountry = InputText();
  InputText tfZipCode = InputText();
  InputText tfCity = InputText();

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
                        child: AuthTopBar(
                      barVisibility: true,
                      title: AppStrings.calculator,
                      textColor: AppColors.primaryColor,
                    )),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      QuickCalculatorScreen()));
                            },
                            child: AuthTopBar(
                              barVisibility: false,
                              title: AppStrings.quickCalculator,
                              textColor: AppColors.greyText,
                            ))),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CardLabel(
                          icon: AppAssets.location,
                          label: AppStrings.addYourAddress),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppCard(Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                              height: 30.h,
                              child: tfCountry
                                  .setHint(AppStrings.selectCountry)
                                  .setSuffixIconVisible(false)),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                              height: 30.h,
                              child: tfCity
                                  .setHint(AppStrings.city)
                                  .setSuffixIconVisible(false)),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                              height: 30.h,
                              child: tfZipCode
                                  .setHint(AppStrings.zipCode)
                                  .setSuffixIconVisible(false)),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 20.h,
                      ),
                      CardLabel(
                          icon: AppAssets.icBox, label: AppStrings.addBoxDetails),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppCard(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppStrings.selectUnitOfMeasurement,
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            child: Row(
                              children: [
                                Radio(
                                  groupValue: 1,
                                  value: false,
                                  onChanged: (val) {},
                                ),
                                Text(AppStrings.measurement1,
                                    style: TextStyle(
                                      color: AppColors.greyText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                    )),
                                SizedBox(width: 20.w,),
                                Radio(
                                  value: false,
                                  onChanged: (val) {}, groupValue: 1,
                                ),
                                Text(AppStrings.measurement2,
                                    style: TextStyle(
                                      color: AppColors.greyText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ],
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: AppButton(
                              buttonText: AppStrings.addBox,
                              margin: EdgeInsets.symmetric(
                                horizontal: 30.w,
                              ),
                              onClick: () {},
                              height: 30.h,
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 20.h,),
                      AppButton(
                        buttonText: AppStrings.getShippingRates,
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        width: 100.w,
                        onClick: () {},
                        height: 30.h,
                      )
                    ],
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
