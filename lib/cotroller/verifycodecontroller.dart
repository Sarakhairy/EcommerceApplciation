import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/verifycode.dart';

import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  CheckCode(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  @override
  CheckCode(String verifycode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
         Get.toNamed("resetpassword", arguments: {
          'email': email,
    });
      } else {
        Get.defaultDialog(
          title: "52".tr,
          middleText: "57".tr,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
