import 'package:flutter_playground_booking_app/presentation/rate_us_experirnce_screen/rate_us_experirnce_screen.dart';
import '../log_out_dialogue/log_out_dialogue.dart';
import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Column(
      children: [
        BuildComponentOne(),
        SizedBox(height: 24.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgAvtar1,
                  height: 80.adaptSize,
                  width: 80.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.h,
                    top: 16.v,
                    bottom: 13.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_john_abram".tr,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: appTheme.black900,
                        ),
                      ),
                      SizedBox(height: 6.v),
                      Text(
                        "msg_johnabram_gmail_com".tr,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: appTheme.black900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 32.v),
        Expanded(
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns children to the left
                    children: [
                      Text(
                        'Personal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(height: 8),
                    ],
                  )),
              buildIcAboutUs(() {
                Get.toNamed(AppRoutes.myProfileScreen);
              }, "lbl_my_profile".tr, Icons.edit),
              SizedBox(height: 16.v),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns children to the left
                    children: [
                      Text(
                        'General',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(height: 8),
                    ],
                  )),
              buildIcAboutUs(() {
                Get.toNamed(AppRoutes.settingsScreen);
              }, "History", Icons.history),
              SizedBox(height: 8),

              buildIcAboutUs(() {
                Get.toNamed(AppRoutes.faqScreen);
              }, "FAQ", Icons.help_outline),
              SizedBox(height: 8),

              buildIcAboutUs(() {
                Get.toNamed('/privacy');
              }, "Privacy Policy", Icons.privacy_tip),
              SizedBox(height: 8),

              buildIcAboutUs(() {
                Get.toNamed('/about');
              }, "About us", Icons.info_outline),
              SizedBox(height: 8),

              buildIcAboutUs(() {
                Get.toNamed('/rate');
              }, "Rate us", Icons.star_border),
              SizedBox(height: 8),

              buildIcAboutUs(() {
                Get.toNamed('/ownground');
              }, "Own Ground", Icons.sports_soccer),
              SizedBox(height: 8),

              buildIcAboutUs(() {
                Get.toNamed('/leaderboard');
              }, "Leaderboard", Icons.leaderboard),
              SizedBox(height: 8),

              buildIcAboutUs(() {
                Get.toNamed('/transaction');
              }, "Transaction History", Icons.receipt_long),
              SizedBox(height: 8),

              buildIcAboutUs(() {
                Get.toNamed(AppRoutes.referEarnScreen);
              }, "Refer & Earn", Icons.card_giftcard),
              SizedBox(height: 8),

              // buildIcAboutUs(() {
              //   Get.toNamed(AppRoutes.settingsScreen);
              // }, "lbl_settings".tr, ImageConstant.imgIcSettings),
              // SizedBox(height: 16.v),
              // buildIcAboutUs(() {
              //   Get.toNamed(AppRoutes.privacyPolicyScreen);
              // }, "Privacy policy".tr, ImageConstant.imgIcPrivacyPolicy),
              // SizedBox(height: 16.v),
              // buildIcAboutUs(() {
              //   Get.toNamed(AppRoutes.helpScreen);
              // }, "lbl_help".tr, ImageConstant.imgIcHelp),
              // SizedBox(height: 16.v),
              // buildIcAboutUs(() {
              //   Get.toNamed(AppRoutes.aboutUsScreen);
              // }, "lbl_about_us".tr, ImageConstant.imgIcAboutUs),
              SizedBox(height: 16.v),
              // buildIcAboutUs(() {
              //   showDialog(
              //     barrierDismissible: false,
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //           insetPadding: EdgeInsets.all(16),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(20)),
              //           contentPadding: EdgeInsets.zero,
              //           content: RateUsExperirnceScreen());
              //     },
              //   );
              // }, "lbl_rate_us".tr, ImageConstant.imgStar120x20),
              SizedBox(height: 16.v),
              // buildIcAboutUs(() {
              //   Get.toNamed(AppRoutes.myGroundsScreen);
              // }, "lbl_my_grounds".tr, ImageConstant.imgIcImage),
              SizedBox(height: 16.v),
              Center(
                child: GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              insetPadding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: EdgeInsets.zero,
                              content: LogOutDialogue());
                        },
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text("Logout",
                            style: CustomTextStyles.titleMediumPrimary700))),
              ),
              SizedBox(height: 16.v),
            ],
          ),
        )
      ],
    );
  }

  /// Common widget
  Widget buildIcAboutUs(onTap, title, icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8.h),
          decoration: AppDecoration.fillGray.copyWith(
            color: appTheme.textfieldFillColor,
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 48.adaptSize,
                width: 48.adaptSize,
                padding: EdgeInsets.all(12.h),
                decoration: AppDecoration.white.copyWith(
                  color: PrefUtils().getThemeData() == "primary"
                      ? appTheme.whiteA700
                      : appTheme.lightgraynightMode,
                  borderRadius: BorderRadiusStyle.circleBorder24,
                ),
                child: Icon(
                  icon, // Use the history icon
                  size: 20, // Set the size of the icon
                  color: Colors.grey, // Set the color of the icon
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 14.v,
                  bottom: 13.v,
                ),
                child: Text(
                  title,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
              Spacer(),
              CustomImageView(
                color: appTheme.black900,
                imagePath: ImageConstant.imgIcNextOnerrorcontainer,
                height: 20.adaptSize,
                width: 20.adaptSize,
                margin: EdgeInsets.only(
                  top: 14.v,
                  right: 8.h,
                  bottom: 13.v,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildComponentOne extends StatefulWidget {
  @override
  _BuildComponentOneState createState() => _BuildComponentOneState();
}

class _BuildComponentOneState extends State<BuildComponentOne> {
  bool isUsSelected = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
        },
      ),
      title: Text(
        'Profile',
        style: theme.textTheme.titleLarge!.copyWith(
          color: appTheme.whiteA700,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ToggleButtons(
            isSelected: [!isUsSelected, isUsSelected],
            onPressed: (index) {
              setState(() {
                isUsSelected = index == 1;
              });
            },
            color: Colors.white,
            selectedColor: Colors.red,
            fillColor: Colors.white,
            selectedBorderColor: Colors.white,
            borderRadius: BorderRadius.circular(20),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('CA'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('US'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
