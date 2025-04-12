import 'package:flutter/material.dart';

/// A controller class for the ReferEarnScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/refer_earn_screen/models/refer_earn_model.dart';

///
/// This class manages the state of the ReferEarnScreen, including the
/// current ReferEarnModelObj
class ReferEarnController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<ReferEarnModel> ReferEarnModelObj = ReferEarnModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
    passwordController.clear();
  }


}
