import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gs_app/src/pages/forgetPassword/verification_code_screen.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_string.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/widget_interactions.dart';
import '../../shared/app_button.dart';
import '../../shared/input_text.dart';
import '../../shared/parent_widget.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  InputText tfEmailAddress = InputText();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.bgColor,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(AppAssets.fotter,)),
            Container(
              padding: EdgeInsets.only(right: 35.h, left: 35.h,top: 35.h),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(AppAssets.appLogo,height: 50.h,)),
                  SizedBox(
                    height: 35.h,
                  ),
                  SizedBox(height: 20.h,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.forgetYourPassword,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: AppColors.lightBlackColor),
                      )),

                  SizedBox(
                    height: 35.h,
                  ),


                  SizedBox(height: 20.h,),
                  tfEmailAddress.setHint(AppStrings.emailAddress),
                  SizedBox(height: 20.h,),


                  SizedBox(height: 20.h,),
                  Hero(
                    tag: "appbtn",
                    child: AppButton(
                        buttonText: AppStrings.getVerificationCode,
                        margin: EdgeInsets.symmetric(horizontal: 60.w),
                        height: 30.h,
                        width: 200.w,
                        onClick: () {
                          verifyUser();
                        }),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void verifyUser() {
    /*bool hasError = validateAll([
     tfEmailAddress

    ]);
    if (hasError) {
      return;
    }*/
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerificationCodeScreen()));

  }

  bool validateAll([List<ParentWidget> args = const []]) {
    bool hasError = false;
    for (ParentWidget inputField in args) {
      bool isError = WidgetInteractions.instance.validateWidget(
          inputField, inputField.tags[AppConstants.FIELD_TYPE].toString());
      if (isError) {
        hasError = true;
      }
    }
    return hasError;
  }
}
