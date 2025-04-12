import 'package:flutter/material.dart';

/// A controller class for the FaqScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/faq_screen/models/faq_model.dart';

///
/// This class manages the state of the FaqScreen, including the
/// current FaqModelObj
class FaqController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<FaqModel> FaqModelObj = FaqModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
    passwordController.clear();
  }


}
