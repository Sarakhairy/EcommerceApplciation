import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  CheckCode();
  ToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verifycode;
  @override
  CheckCode() {}

  @override
  ToSuccessSignUp() {
    Get.toNamed("successsignup");
  }

  @override
  void onInit() {
    super.onInit();
  }
}
