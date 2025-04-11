import '../controller/choose_country_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseCountryScreen.
///
/// This class ensures that the ChooseCountryController is created when the
/// ChooseCountryScreen is first loaded.
class ChooseCountryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseCountryController());
  }
}
