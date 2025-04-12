import '../controller/refer_earn_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ReferEarnScreen.
///
/// This class ensures that the ReferEarnController is created when the
/// ReferEarnScreen is first loaded.
class ReferEarnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReferEarnController());
  }
}
