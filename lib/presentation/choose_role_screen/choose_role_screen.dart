// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'controller/choose_role_controller.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  ChooseRoleController controller = Get.put(ChooseRoleController());

  String selectedRole = 'Continue as Player';

  void selectRole(String role) {
    setState(() {
      selectedRole = role;
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
                  getCommonAppBar("lbl_choose_your_role".tr),
                  // CustomImageView(
                  //   imagePath: ImageConstant.roleImage,
                  //   height: MediaQuery.of(context).size.width,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.v),
                    child: Column(
                      children: [
                        Text(
                          'Are you a player or host?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 30),
                        OptionCard(
                          imageUrl: ImageConstant.playerImage,
                          title: 'Player',
                          description: 'Join games and events.',
                        ),
                        SizedBox(height: 30),
                        OptionCard(
                          imageUrl: ImageConstant.hostImage,
                          title: 'Host',
                          description: 'Create and manage games and events.',
                        ),
                        SizedBox(height: 150.v),
                        buildButton('Continue as Player'),
                        SizedBox(height: 10.v),
                        buildButton('Continue as Host'),
                      ],
                    ),
                  ),
                ])),
          )),
    );
  }

  Widget buildButton(String role) {
    bool isSelected = selectedRole == role;

    return GestureDetector(
      onTap: () => {
        selectRole(role),
        Get.toNamed(
          AppRoutes.chooseCityScreen,
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
          role,
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

class OptionCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  OptionCard(
      {required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        children: [
          CustomImageView(
            imagePath: imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
