// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/choose_city_screen/models/choose_city_model.dart';
import 'package:flutter_playground_booking_app/widgets/custom_search_view.dart';
import 'controller/choose_city_controller.dart';

class ChooseCityScreen extends StatefulWidget {
  const ChooseCityScreen({super.key});

  @override
  State<ChooseCityScreen> createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen> {
  ChooseCityController controller = Get.put(ChooseCityController());

  @override
  void initState() {
    // TODO: implement initState
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
                  getCommonAppBar("lbl_choose_a_city".tr),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.v),
                    child: Column(
                      children: [
                        CustomSearchView(
                            onTap: () {
                              // Get.toNamed(AppRoutes.searchScreen);
                            },
                            textInputType: TextInputType.none,
                            controller: controller.searchController,
                            hintText: "lbl_search_state_or_city".tr),
                        SizedBox(height: 30.v),
                        // buildListview(),
                      ],
                    ),
                  ),
                ])),
          )),
    );
  }

  Widget buildListview() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 4, left: 20.h, right: 20.h),
      primary: false,
      shrinkWrap: true,
      itemCount: controller.cityDataList.length,
      itemBuilder: (context, index) {
        ChooseCityModel data = controller.cityDataList[index];
        return animationfunction(
            index,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.v),
              child: GestureDetector(
                  onTap: () {
                    // onTapPreviousHistory();
                    print("clicked!");
                  },
                  child: Container(
                      padding: EdgeInsets.all(4.h),
                      decoration: AppDecoration.fillGray.copyWith(
                          color: appTheme.textfieldFillColor,
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Row(children: [
                        CustomImageView(
                            imagePath: data.image,
                            height: 90.adaptSize,
                            width: 90.adaptSize,
                            radius: BorderRadius.circular(16.h)),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 16.h, top: 8.v, bottom: 5.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.name!,
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(color: appTheme.black900)),
                                  SizedBox(height: 5.v),
                                  // _buildFrame1(greece: data.location!),
                                  // SizedBox(height: 9.v),
                                  Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgIcBooking,
                                        height: 20.adaptSize,
                                        width: 20.adaptSize),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 7.h, top: 2.v),
                                        child: Text(data.state!,
                                            style: theme.textTheme.bodyMedium))
                                  ])
                                ])),
                        Spacer(),
                        Padding(
                            padding: EdgeInsets.only(
                                top: 33.v, right: 12.h, bottom: 34.v),
                            child: Text(data.country!,
                                style: theme.textTheme.titleMedium!
                                    .copyWith(color: appTheme.black900)))
                      ]))),
            ));
      },
    );
  }
}
