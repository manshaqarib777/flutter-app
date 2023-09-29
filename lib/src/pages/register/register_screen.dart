import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gs_app/config/app_string.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/widget_interactions.dart';
import '../../shared/app_button.dart';
import '../../shared/auth_top_bar.dart';
import '../../shared/base_textfield.dart';
import '../../shared/input_text.dart';
import '../../shared/parent_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  InputText tfFirstName = InputText();
  InputText tfLastName = InputText();
  InputText tfPhoneNo = InputText();
  InputText tfEmailAddress = InputText();
  InputText tfPassword = InputText();
  InputText tfConfirmPassword = InputText();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.bgColor,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 35.h),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(AppAssets.appLogo,height: 50.h,)),
              SizedBox(
                height: 35.h,
              ),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                   AppStrings.registerHeader,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: AppColors.lightBlackColor),
                  )),

              SizedBox(
                height: 35.h,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: AuthTopBar(
                            barVisibility: false,
                            title: AppStrings.LOGIN,
                            textColor: AppColors.greyText,
                          ),
                        )),
                    Expanded(
                        child: AuthTopBar(
                          barVisibility: true,
                          title: AppStrings.REGISTER,
                          textColor: AppColors.primaryColor,
                        )),

                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [

                    SizedBox(height: 20.h,),
                    tfFirstName.setHint(AppStrings.firstName),
                    SizedBox(height: 20.h,),
                    tfLastName.setHint(AppStrings.lastName),
                    SizedBox(height: 20.h,),
                    tfEmailAddress.setHint(AppStrings.emailAddress),
                    SizedBox(height: 20.h,),
                    tfPhoneNo.setHint(AppStrings.phoneNumber),
                    SizedBox(height: 20.h,),
                    tfPassword
                        .setHint(AppStrings.password)
                        .setFieldType(TextFieldType.PASSWORD),
                    SizedBox(height: 20.h,),
                    tfConfirmPassword
                        .setHint(AppStrings.confirmPassword)
                        .setFieldType(TextFieldType.PASSWORD),

                    SizedBox(height: 20.h,),
                  ],),
                ),
              ),

              Hero(
                tag: "appbtn",
                child: AppButton(
                    buttonText: AppStrings.register,
                    margin: EdgeInsets.zero,
                    height: 30.h,
                    onClick: () {
                      registerUser();
                    }),
              ),
              SizedBox(height: 20.h,),
              InkWell(
                onTap: (){},
                child: Text(
                  AppStrings.alreadyHaveAnAccount,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.greyText),
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
  void registerUser() {
    bool hasError = validateAll([
      tfFirstName,
      tfLastName,
      tfPhoneNo,
      tfEmailAddress,
      tfPassword,
      tfConfirmPassword,
    ]);
    if (hasError) {
      return;
    }
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
