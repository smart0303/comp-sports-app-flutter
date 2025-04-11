import '../controller/choose_city_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseCityScreen.
///
/// This class ensures that the ChooseCityController is created when the
/// ChooseCityScreen is first loaded.
class ChooseCityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseCityController());
  }
}
