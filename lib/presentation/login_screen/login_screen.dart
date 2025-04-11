// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/core/utils/validation_functions.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        closeApp();
        return false;
      },
      child: Scaffold(
          backgroundColor: appTheme.bgColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 20.h, vertical: 36.v),
                    child: Column(children: [
                      CustomImageView(
                        imagePath: ImageConstant.loginImage,
                        height: MediaQuery.of(context).size.width * 185 / 430,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.h, vertical: 30.v),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("lbl_log_in".tr,
                                    style: theme.textTheme.headlineMedium!
                                        .copyWith(color: appTheme.black900))),
                            SizedBox(height: 10.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: 363.h,
                                    margin: EdgeInsets.only(right: 24.h),
                                    child: Text("msg_please_enter_your".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(
                                                color: appTheme.black900,
                                                height: 1.50)))),
                            SizedBox(height: 45.v),
                            CustomTextFormField(
                              controller: controller.emailController,
                              hintText: "lbl_email_address".tr,
                              hintStyle: TextStyle(
                                fontStyle: FontStyle
                                    .italic, // ✅ Make the hint text italic
                                color: Colors
                                    .grey, // Optional: Adjust color for better visibility
                              ),
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter a valid email address.";
                                }
                                return null;
                              },
                              prefix: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        12.0), // Adjust spacing if needed
                                child: Icon(Icons.alternate_email,
                                    color: Colors.grey),
                              ),
                              prefixConstraints: BoxConstraints(
                                  minWidth: 40,
                                  minHeight: 40), // Ensure proper alignment
                            ),
                            SizedBox(height: 15.v),
                            Obx(() => CustomTextFormField(
                                  controller: controller.passwordController,
                                  hintText: "lbl_password".tr,
                                  hintStyle: TextStyle(
                                    fontStyle: FontStyle
                                        .italic, // ✅ Make the hint text italic
                                    color: Colors
                                        .grey, // Optional: Adjust color for better visibility
                                  ),
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword.value =
                                            !controller.isShowPassword.value;
                                      },
                                      child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              30.h, 18.v, 18.h, 18.v),
                                          child: CustomImageView(
                                              color: appTheme.black900,
                                              imagePath: !controller
                                                      .isShowPassword.value
                                                  ? ImageConstant.imgIcEye
                                                  : ImageConstant.imgIcEyeClose,
                                              height: 20.adaptSize,
                                              width: 20.adaptSize))),
                                  suffixConstraints:
                                      BoxConstraints(maxHeight: 56.v),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid password.";
                                    }
                                    return null;
                                  },
                                  obscureText: controller.isShowPassword.value,
                                  contentPadding: EdgeInsets.only(
                                      left: 16.h, top: 18.v, bottom: 18.v),

                                  prefix: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            12.0), // Adjust spacing if needed
                                    child: Icon(Icons.lock_outline,
                                        color: Colors.grey),
                                  ),
                                  prefixConstraints: BoxConstraints(
                                      minWidth: 40,
                                      minHeight: 40), // Ensure proper alignment
                                )),
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapTxtForgotPassword();
                                    },
                                    child: Text("msg_forgot_password".tr,
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(
                                                color: appTheme.black900)))),
                            SizedBox(height: 20.v),
                            CustomElevatedButton(
                              text: "lbl_log_in".tr,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  PrefUtils.setIsSignIn(false);
                                  onTapLogIn();
                                }
                              },
                              buttonStyle: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                )),
                              ),
                            ),
                            SizedBox(height: 10.v),
                            Align(
                                alignment: Alignment.center,
                                child: Text("lbl_log_in_or".tr,
                                    style: theme.textTheme.headlineSmall!
                                        .copyWith(color: appTheme.black900))),
                            SizedBox(height: 10.v),
                            CustomElevatedButton(
                                text: "lbl_log_in_google".tr,
                                leftIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      right:
                                          10), // Add padding between icon and text
                                  child: Image.asset(
                                    ImageConstant
                                        .googleLogo, // Path to the Google icon image
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                buttonStyle: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white), // Set button color
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Rounded corners
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: 1), // 1px solid black border
                                  )),
                                ),
                                buttonTextStyle: TextStyle(
                                  color: Colors
                                      .black, // Set the text color to black
                                ),
                                onPressed: () {
                                  // if (_formKey.currentState!.validate()) {
                                  PrefUtils.setIsSignIn(false);
                                  onTapLogIn();
                                  // }
                                }),
                            SizedBox(height: 10.v),
                            CustomElevatedButton(
                                text: "lbl_log_in_facebook".tr,
                                leftIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      right:
                                          10), // Add padding between icon and text
                                  child: Image.asset(
                                    ImageConstant.facebookLogo,
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                buttonStyle: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white), // Set button color
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Rounded corners
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: 1), // 1px solid black border
                                  )),
                                ),
                                buttonTextStyle: TextStyle(
                                  color: Colors
                                      .black, // Set the text color to black
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    PrefUtils.setIsSignIn(false);
                                    onTapLogIn();
                                  }
                                }),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 1.v),
                                child: Text("msg_don_t_have_an_account".tr,
                                    style:
                                        CustomTextStyles.bodyLargeGray60001)),
                            GestureDetector(
                                onTap: () {
                                  onTapTxtSignUp();
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text("lbl_sign_up".tr,
                                        style: CustomTextStyles
                                            .titleMediumPrimary
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: theme
                                                    .colorScheme.primary))))
                          ]),
                      SizedBox(height: 20.v),
                    ]))),
          )),
    );
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotPassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapLogIn() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  onTapTxtSignUp() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
