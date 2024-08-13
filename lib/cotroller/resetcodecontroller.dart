import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController  extends GetxController {
  resetpassword();
  ToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  resetpassword() {}

  @override
 ToSuccessResetPassword() {
  var formdata = formstate.currentState;
    if (formdata!.validate()) {
       Get.toNamed("successresetpassword");
        Get.delete<ResetPasswordControllerImp>();
    } else {
      print("not valid");
    }
  
   
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
