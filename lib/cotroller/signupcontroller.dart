import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  SignUp();
  ToLogIn();
}

class SignUpControllerImp extends SignupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  SignUp() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed("verifycodesignup");
      Get.delete<SignUpControllerImp>();
    } else {
      print("not valid");
    }
  }

  @override
  ToLogIn() {
    Get.toNamed("login");
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
