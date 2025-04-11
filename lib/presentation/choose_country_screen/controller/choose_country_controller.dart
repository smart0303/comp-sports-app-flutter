import 'package:flutter/material.dart';

/// A controller class for the ChooseCountryScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/choose_country_screen/models/choose_country_model.dart';

///
/// This class manages the state of the ChooseCountryScreen, including the
/// current ChooseCountryModelObj
class ChooseCountryController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<ChooseCountryModel> ChooseCountryModelObj = ChooseCountryModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
    passwordController.clear();
  }


}
