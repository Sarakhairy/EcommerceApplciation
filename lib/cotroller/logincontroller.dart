import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  Login();
  ToSignUp();
  ToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  ToSignUp() {
    Get.offNamed("signup");
     Get.delete<LoginControllerImp>();
  }

  @override
  ToForgetPassword() {
    Get.toNamed("forgetpassword");
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
