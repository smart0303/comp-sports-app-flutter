import 'package:flutter/material.dart';

/// A controller class for the ChooseRoleScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/choose_role_screen/models/choose_role_model.dart';

///
/// This class manages the state of the ChooseRoleScreen, including the
/// current ChooseRoleModelObj
class ChooseRoleController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<ChooseRoleModel> ChooseRoleModelObj = ChooseRoleModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
    passwordController.clear();
  }


}
