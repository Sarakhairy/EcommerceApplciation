import 'package:ecommerce_application/core/constant/color.dart';

import 'package:ecommerce_application/cotroller/verifycodecontroller.dart';

import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "20".tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: ColorApp.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(builder: (controller)=> HadnlingDataRequest(statusRequest: controller.statusRequest,widget:Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(
              "23".tr + " " + "${controller.email}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: ColorApp.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            OtpTextField(
              fieldHeight: 50,
              borderRadius: BorderRadius.circular(10),
              numberOfFields: 5,
              borderColor: Colors.black,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.CheckCode(verificationCode);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
      )
    );
  }
}
