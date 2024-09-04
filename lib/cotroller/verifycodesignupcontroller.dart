import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/verifycodesignup.dart';

import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  CheckCode();
  reSend();
  ToSuccessSignUp(String verifycodesignup);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  CheckCode() {}

  @override
  ToSuccessSignUp(String verifycodesignup) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignUpData.postData(email!, verifycodesignup);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.toNamed("successsignup");
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

  @override
  reSend() {
    verifyCodeSignUpData.resendData(email!);
  }
}
