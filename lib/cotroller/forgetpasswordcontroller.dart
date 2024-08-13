import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  CheckEmail();
  ToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  CheckEmail() {}

  @override
  ToVerifyCode() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
       Get.toNamed("verifycode");
    } else {
      print("not valid");
    }
  
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
