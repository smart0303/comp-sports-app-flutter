import '../controller/choose_role_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseRoleScreen.
///
/// This class ensures that the ChooseRoleController is created when the
/// ChooseRoleScreen is first loaded.
class ChooseRoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseRoleController());
  }
}
