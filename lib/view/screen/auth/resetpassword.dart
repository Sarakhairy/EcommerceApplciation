import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/cotroller/forgetpasswordcontroller.dart';
import 'package:ecommerce_application/cotroller/resetcodecontroller.dart';
import 'package:ecommerce_application/cotroller/signupcontroller.dart';
import 'package:ecommerce_application/view/widget/auth/authoptions.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutomtextformauth.dart';
import 'package:ecommerce_application/view/widget/auth/logoauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "24".tr,
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
              "25".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorApp.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextFormAuth(
                mycontroller: controller.password,
                hint: 26,
                label: 27,
                iconData: Icons.lock_outline),
            SizedBox(
              height: 20,
            ),
            CustomTextFormAuth(
                mycontroller: controller.repassword,
                hint: 28,
                label: 29,
                iconData: Icons.lock_outline),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            CutomButtonAuth(
                text: "19".tr,
                onPressed: () {
                  controller.ToSuccessResetPassword();
                }),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
