import 'package:ecommerce_application/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  logOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed("login");
  }
}
