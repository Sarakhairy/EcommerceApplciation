import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  ToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  ToLogin() {
    Get.offAllNamed("login");
  }
}