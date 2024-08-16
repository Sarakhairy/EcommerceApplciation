import 'package:ecommerce_application/core/class/crud.dart';
import 'package:get/get.dart';

class IntialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
