import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gs_app/config/app_string.dart';
import 'package:gs_app/src/pages/forgetPassword/forget_password_screen.dart';
import 'package:gs_app/src/pages/register/register_screen.dart';
import 'package:gs_app/src/shared/auth_top_bar.dart';

import '../../../api_service/requset_attr.dart';
import '../../../api_service/server_request.dart';
import '../../../api_service/server_response.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../enums/requestTypes.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/widget_interactions.dart';
import '../../shared/app_button.dart';
import '../../shared/base_textfield.dart';
import '../../shared/input_text.dart';
import '../../shared/parent_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  InputText tfEmailSnNo = InputText();
  InputText passwordTextField = InputText();

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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.welcome,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColors.lightBlackColor),
                      )),
                  SizedBox(
                    height: 35.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: AuthTopBar(
                              barVisibility: true,
                              title: AppStrings.LOGIN,
                              textColor: AppColors.primaryColor,
                            )),
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                                },
                                child: AuthTopBar(
                                  barVisibility: false,
                                  title: AppStrings.REGISTER,
                                  textColor: AppColors.greyText,
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  tfEmailSnNo.setHint(AppStrings.emailSnNo),
                  SizedBox(
                    height: 20.h,
                  ),
                  passwordTextField
                      .setHint(AppStrings.PASSWORD)
                      .setFieldType(TextFieldType.PASSWORD),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                      },
                      child: Text(
                        AppStrings.forgetPassword,
                        style:
                            TextStyle(fontSize: 12.sp, color: AppColors.greyText),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: "appbtn",
                        child: AppButton(
                            buttonText: AppStrings.login,
                            margin: EdgeInsets.zero,
                            height: 25.h,
                            onClick: () {
                              loginUser();
                            }),
                      ),
                      Row(
                        children: [
                          Text(
                            AppStrings.newUser,
                            style:
                            TextStyle(fontSize: 12.sp, color: AppColors.greyText),
                          ),

                          InkWell(
                            onTap: () {},
                            child: Text(
                              AppStrings.register,
                              style:
                              TextStyle(fontSize: 12.sp, color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
         

          ],
        ),
      ),
    );
  }

  void loginUser() async{
  //  ServerResponse response = await ServerRequest().request(RequestAttr.withParamsAndBody("https://qa.mfsys.com.pk:8081/security/auth/user",HttpMethod.POST ,{"username":"hassan","password":"12345678","clientid":"001"},{"mobileLogin": "false"}));

     bool hasError = validateAll([
      tfEmailSnNo,
      passwordTextField,
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
