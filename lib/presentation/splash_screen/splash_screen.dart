// ignore_for_file: deprecated_member_use

import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());
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
        body: SafeArea(
          child: CustomImageView(
            width: double.infinity, // Full width
            height: double.infinity, // Full height
            imagePath: ImageConstant.imgGroup2,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
