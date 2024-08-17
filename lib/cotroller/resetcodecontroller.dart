import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
 StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  resetpassword() async {
    if (password.text != repassword.text){
      return Get.defaultDialog(
            title: "52".tr,
            middleText: "59".tr,
          );
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!,password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
           Get.toNamed("successresetpassword");
        } else {
          Get.defaultDialog(
            title: "52".tr,
            middleText: "61".tr,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }else {
      print("not valid");
    }
  }

  

  @override
  void onInit() {
    email = Get.arguments['email'];
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
