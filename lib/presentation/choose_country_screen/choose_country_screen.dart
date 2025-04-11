// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'controller/choose_country_controller.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({super.key});

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  ChooseCountryController controller = Get.put(ChooseCountryController());

  String selectedCountry = 'lbl_usa'.tr;

  void selectCountry(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

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
            child: Container(
                width: double.maxFinite,
                // padding:
                //     EdgeInsets.symmetric(horizontal: 20.h, vertical: 36.v),
                child: Column(children: [
                  getCommonAppBar("lbl_choose_your_country".tr),
                  CustomImageView(
                    imagePath: ImageConstant.countryImage,
                    height: MediaQuery.of(context).size.width,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.v),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text("lbl_choose_your_country".tr,
                                style: theme.textTheme.headlineMedium!
                                    .copyWith(color: appTheme.black900))),
                        SizedBox(height: 30.v),
                        buildButton('lbl_usa'.tr),
                        SizedBox(height: 10.v),
                        buildButton('lbl_canada'.tr),
                      ],
                    ),
                  ),
                ])),
          )),
    );
  }

  Widget buildButton(String country) {
    bool isSelected = selectedCountry == country;

    return GestureDetector(
      onTap: () => {
        selectCountry(country),
        Get.toNamed(
          AppRoutes.chooseRoleScreen,
        )
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : Colors.white,
          border: Border.all(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          country,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
