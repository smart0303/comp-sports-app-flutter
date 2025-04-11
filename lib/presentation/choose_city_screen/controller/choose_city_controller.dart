import 'package:flutter/material.dart';

/// A controller class for the ChooseCityScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/choose_city_screen/models/choose_city_model.dart';
import '../models/cities_data.dart';

///
/// This class manages the state of the ChooseCityScreen, including the
/// current ChooseCityModelObj
class ChooseCityController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<ChooseCityModel> cityDataList = CityDataList.getCityListData();

  @override
  void onClose() {
    super.onClose();
    searchController.clear();
  }


}
