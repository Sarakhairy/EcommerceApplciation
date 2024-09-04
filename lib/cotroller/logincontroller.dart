import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/login.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  Login();
  ToSignUp();
  ToForgetPassword();
}

class LoginControllerImp extends LoginController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  late TextEditingController email;
  late TextEditingController password;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['user_approve'] == 1) {
            print("${response['data']['user_approve']}==================");
            Get.offNamed("home");
            myServices.sharedPreferences.setString("step", "2");
            myServices.sharedPreferences
                .setString("id", "${response['data']['user_id']}");
            myServices.sharedPreferences
                .setString("username", "${response["data"]["user_name"]}");
            myServices.sharedPreferences
                .setString("email", "${response['data']['user_email']}");
            myServices.sharedPreferences
                .setString("phone", "${response['data']['user_phone']}");
          } else {
            verifyCodeSignUpData.resendData(email.text);
            Get.toNamed("verifycodesignup", arguments: {
              "email": email.text,
            });
          }
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
