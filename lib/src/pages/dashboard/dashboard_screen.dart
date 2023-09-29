import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gs_app/config/app_assets.dart';
import 'package:gs_app/config/app_colors.dart';
import 'package:gs_app/src/pages/dashboard/widgets/card_label.dart';
import 'package:gs_app/src/pages/dashboard/widgets/center_card.dart';
import 'package:gs_app/src/pages/dashboard/widgets/data_text.dart';
import 'package:gs_app/src/pages/dashboard/widgets/grad_card.dart';
import 'package:gs_app/src/pages/dashboard/widgets/top_bar.dart';
import 'package:gs_app/src/shared/app_button.dart';
import 'package:gs_app/src/shared/app_card.dart';

import '../../../config/app_string.dart';
import '../../shared/input_text.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  InputText tfTrackingNo = InputText();
  InputText tfSpecialInstruction = InputText();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          children: [
            AppTopBar(rightIcon: AppAssets.notification, rightIconBgColor: AppColors.bgNotification, toolbarLabel: AppStrings.myDashboard),
            Expanded(
              child: SingleChildScrollView(
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                 child: Column(
                   children: [
                     Padding(
                       padding: EdgeInsets.symmetric(vertical: 10.h),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           GradCard(
                             gradientColors: const [
                               AppColors.card1Grad1,
                               AppColors.card1Grad2
                             ],
                             counter: "10",
                             label: AppStrings.myStorage,
                           ),
                           GradCard(
                             gradientColors: const [
                               AppColors.card2Grad1,
                               AppColors.card2Grad2
                             ],
                             counter: "8",
                             label: AppStrings.outgoing,
                           ),
                           GradCard(
                             gradientColors: const [
                               AppColors.card3Grad1,
                               AppColors.card3Grad2
                             ],
                             counter: "5",
                             label: AppStrings.shipped,
                           ),
                           GradCard(
                             gradientColors: const [
                               AppColors.card4Grad1,
                               AppColors.card4Grad2
                             ],
                             counter: "3",
                             label: AppStrings.delivered,
                           )
                         ],
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric( vertical: 20.h),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CenterCard(
                               icon: AppAssets.icCalculator,
                               label: AppStrings.shippingCalculator),
                           CenterCard(
                               icon: AppAssets.icBox,
                               label: AppStrings.storageNShipsCenter),
                           CenterCard(
                               icon: AppAssets.icReturn,
                               label: AppStrings.beginAssistedPurchase),
                         ],
                       ),
                     ),
                     CardLabel(icon: AppAssets.location,label: AppStrings.muUsAddress),
                     SizedBox(height: 8.h,),
                     Card(
                       elevation: 5,
                       color: AppColors.bgColor,
                       shape: Border(bottom: BorderSide(color: AppColors.greyText, width: 5)),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             DataText(title:AppStrings.fullName ,description: "Ameer Hamza SN-0124",),
                             DataText(title:AppStrings.company ,description: "GOLOBAL SHOPOHOLIC",),
                             DataText(title:AppStrings.address ,description: "342 Quiz Bruc,Unit N",),
                             DataText(title:AppStrings.city ,description: "New Castle",),
                             DataText(title:AppStrings.state ,description: "Delaware",),
                             DataText(title:AppStrings.zipCode ,description: "19782",),
                             SizedBox(height: 4.h,),
                             Align(
                                 alignment: Alignment.bottomRight,
                                 child: Text(AppStrings.howToTypeAddress,style: TextStyle(color: AppColors.bgNotification,fontSize: 12.sp,fontWeight: FontWeight.w600,))),
                           ],),
                       ),
                     ),
                     SizedBox(height: 20.h,),
                     CardLabel(icon: AppAssets.icBox,label: AppStrings.incomingPackage),
                     SizedBox(height: 8.h,),
                    AppCard(
                        Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        tfTrackingNo.setHint(AppStrings.trackingNo).setSuffixIconVisible(false),
                        SizedBox(
                          height: 10.h,
                        ),
                        tfSpecialInstruction.setHint(AppStrings.specialInstructions).setSuffixIconVisible(false),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 15.h),
                          child: Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (val) {
                                },
                              ),
                              Text(AppStrings.dashboardCheckBox,style: TextStyle(color: AppColors.greyText,fontSize: 12.sp,fontWeight: FontWeight.w300,)),

                            ],
                          ),
                        ),
                        AppButton(buttonText: AppStrings.submit, margin: EdgeInsets.symmetric(horizontal: 30.w,), onClick: (){},height: 30.h,)
                      ],))
                   ],
                 ),
               ),
           ),
            ),

          ],
        ),
      ),
    ));
  }
}
