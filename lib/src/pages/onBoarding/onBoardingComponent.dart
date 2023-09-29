import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gs_app/config/app_assets.dart';
import 'package:gs_app/src/pages/login/login_screen.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_string.dart';

class OnBoardingComponent extends StatelessWidget {
  Color labelColor;
  Color backgroundColor;
  Color indicatorColor;
  Function nextClick;

  OnBoardingComponent({super.key,
  required this.labelColor,
    required this.backgroundColor,
    required this.indicatorColor,
    required this.nextClick,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Image.asset(
                              AppAssets.appLogo,
                              height: 50.h,
                              color: labelColor,
                            )),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            AppStrings.skip,
                            style: TextStyle(
                                fontSize: 12.sp, color: AppColors.btnSkip),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Image.asset(AppAssets.bgBoarding2,
                          )),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.boardingOneTitle,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: labelColor),
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            AppStrings.boardingOneTitle2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                                color: labelColor),
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            AppStrings.boardingOneDescription,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: labelColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
                    width: 40.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      CircleAvatar(backgroundColor: labelColor,radius: 10),
                        CircleAvatar(backgroundColor: indicatorColor,radius: 8),
                        CircleAvatar(backgroundColor: indicatorColor,radius: 8),

                    ],),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap:(){ nextClick();},
                  child: Stack(
                    //alignment: Alignment.topLeft,
                    children: [
                      Align(
                        child: Container(
                          width: 25.w,
                          color: labelColor,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      Column(
                        children: [
                          const Spacer(),
                          Container(
                            margin:  EdgeInsets.only(bottom: 150.h),
                            decoration:  BoxDecoration(
                              color: labelColor,
                              borderRadius:
                                const  BorderRadius.all(Radius.elliptical(45, 45)),
                            ),
                            padding: const EdgeInsets.all(6),
                            child: InkWell(
                              onTap: () {
                                nextClick();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.bgBoarding,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppColors.white,
                                    child: Image.asset(
                                      AppAssets.icBackArrow,
                                      color: AppColors.primaryColor,
                                      width: 12.w,
                                      height: 12.h,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
