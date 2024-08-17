import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  CheckEmail();

}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  CheckEmail() async{
    if(formstate.currentState!.validate()){
        statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed("verifycode",arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
            title: "52".tr,
            middleText: "59".tr,
            
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
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
