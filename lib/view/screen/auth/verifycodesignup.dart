import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/cotroller/forgetpasswordcontroller.dart';
import 'package:ecommerce_application/cotroller/signupcontroller.dart';
import 'package:ecommerce_application/cotroller/verifycodecontroller.dart';
import 'package:ecommerce_application/cotroller/verifycodesignupcontroller.dart';
import 'package:ecommerce_application/view/widget/auth/authoptions.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutomtextformauth.dart';
import 'package:ecommerce_application/view/widget/auth/logoauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller = Get.put(VerifyCodeSignUpControllerImp());
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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(
              "23".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorApp.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
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
                controller.ToSuccessSignUp();
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
