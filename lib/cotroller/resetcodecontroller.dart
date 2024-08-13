import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController  extends GetxController {
  resetpassword();
  ToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  @override
  resetpassword() {}

  @override
 ToSuccessResetPassword() {
    Get.toNamed("successresetpassword");
  }
   @override
  ToForgetPassword() {
    Get.toNamed("successresetpassword");
  }

  @override
  void onInit() {
    repassword = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    repassword.dispose();
    password.dispose();
    super.dispose();
  }
  
 
}
