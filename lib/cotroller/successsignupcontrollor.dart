import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  ToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  ToLogin() {
    Get.offAllNamed("login");
  }
}
