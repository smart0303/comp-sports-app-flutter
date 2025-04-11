import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/core/utils/validation_functions.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
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
                          SizedBox(height: 45.v),
                          buildEmail(),
                          SizedBox(height: 20.v),
                          buildPhoneNumber(),
                          SizedBox(height: 20.v),
                          buildPassword(),
                          SizedBox(height: 20.v),
                          buildConfirmPassword(),
                          SizedBox(height: 20.v),
                          CustomElevatedButton(
                            text: "lbl_sign_up".tr,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                PrefUtils.setIsSignIn(false);
                                onTapSignUp();
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
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text("msg_already_have_an".tr,
                              style: CustomTextStyles.bodyLargeGray60001)),
                      GestureDetector(
                          onTap: () {
                            onTapTxtLogIn();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text("lbl_log_in".tr,
                                  style: CustomTextStyles.titleMediumPrimary
                                      .copyWith(
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              theme.colorScheme.primary))))
                    ]),
                    SizedBox(height: 20.v),
                  ]))),
        ));
  }

  /// Section Widget
  Widget buildFirstName() {
    return CustomTextFormField(
        controller: controller.firstNameController,
        hintText: "lbl_first_name".tr,
        validator: (value) {
          if (!isText(value) || value!.isEmpty) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget buildLastName() {
    return CustomTextFormField(
        controller: controller.lastNameController,
        hintText: "lbl_last_name".tr,
        validator: (value) {
          if (!isText(value) || value!.isEmpty) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      hintText: "lbl_email_address".tr,
      hintStyle: TextStyle(
        fontStyle: FontStyle.italic, // ✅ Make the hint text italic
        color: Colors.grey, // Optional: Adjust color for better visibility
      ),
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "Please enter a valid email address.";
        }
        return null;
      },
      prefix: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 12.0), // Adjust spacing if needed
        child: Icon(Icons.alternate_email, color: Colors.grey),
      ),
      prefixConstraints: BoxConstraints(
          minWidth: 40, minHeight: 40), // Ensure proper alignment
    );
  }

  Widget buildPhoneNumber() {
    return CustomTextFormField(
      controller: controller.phoneNumberController,
      hintText: "lbl_phone_number".tr,
      hintStyle: TextStyle(
        fontStyle: FontStyle.italic, // ✅ Make the hint text italic
        color: Colors.grey, // Optional: Adjust color for better visibility
      ),
      textInputType: TextInputType.phone,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
          return "Please enter a valid phone number.";
        }
        return null;
      },
      prefix: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 12.0), // Adjust spacing if needed
        child: Icon(Icons.phone, color: Colors.grey),
      ),
      prefixConstraints: BoxConstraints(
        minWidth: 40,
        minHeight: 40,
      ), // Ensure proper alignment
    );
  }

  /// Section Widget
  Widget buildPassword() {
    return Obx(() => CustomTextFormField(
          controller: controller.passwordController,
          hintText: "lbl_password".tr,
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic, // ✅ Make the hint text italic
            color: Colors.grey, // Optional: Adjust color for better visibility
          ),
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
              onTap: () {
                controller.isShowPassword.value =
                    !controller.isShowPassword.value;
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 18.v, 18.h, 18.v),
                  child: CustomImageView(
                      color: appTheme.black900,
                      imagePath: !controller.isShowPassword.value
                          ? ImageConstant.imgIcEye
                          : ImageConstant.imgIcEyeClose,
                      height: 20.adaptSize,
                      width: 20.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter valid password.";
            }
            return null;
          },
          obscureText: controller.isShowPassword.value,
          contentPadding: EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v),

          prefix: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 12.0), // Adjust spacing if needed
            child: Icon(Icons.lock_outline, color: Colors.grey),
          ),
          prefixConstraints: BoxConstraints(
              minWidth: 40, minHeight: 40), // Ensure proper alignment
        ));
  }

  /// Section Widget
  Widget buildConfirmPassword() {
    return Obx(() => CustomTextFormField(
          controller: controller.confirmPasswordController,
          hintText: "msg_confirm_password".tr,
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic, // ✅ Make the hint text italic
            color: Colors.grey, // Optional: Adjust color for better visibility
          ),
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
              onTap: () {
                controller.isShowPassword.value =
                    !controller.isShowPassword.value;
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 18.v, 18.h, 18.v),
                  child: CustomImageView(
                      color: appTheme.black900,
                      imagePath: !controller.isShowPassword.value
                          ? ImageConstant.imgIcEye
                          : ImageConstant.imgIcEyeClose,
                      height: 20.adaptSize,
                      width: 20.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter valid password.";
            }
            return null;
          },
          obscureText: controller.isShowPassword.value,
          contentPadding: EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v),

          prefix: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 12.0), // Adjust spacing if needed
            child: Icon(Icons.lock_outline, color: Colors.grey),
          ),
          prefixConstraints: BoxConstraints(
              minWidth: 40, minHeight: 40), // Ensure proper alignment
        ));
  }

  /// Section Widget
  Widget buildSignUp() {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            onTapSignUp();
          }
        });
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapSignUp() {
    Get.toNamed(
      AppRoutes.verificationScreen,
    );
    // Get.back();
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLogIn() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
