import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  CheckCode();
  ToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifycode;
  @override
  CheckCode() {}

  @override
  ToResetPassword() {
    Get.toNamed("resetpassword");
  }

  @override
  void onInit() {
   

    super.onInit();
  }

}
