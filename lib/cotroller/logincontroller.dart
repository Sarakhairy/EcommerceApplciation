import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/login.dart';
import 'package:ecommerce_application/view/screen/auth/login.dart';
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
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Login() async{
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text,password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed("home");
        } else {
          Get.defaultDialog(
            title: "52".tr,
            middleText: "58".tr,
            
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  @override
  ToSignUp() {
    Get.offNamed("signup");
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
