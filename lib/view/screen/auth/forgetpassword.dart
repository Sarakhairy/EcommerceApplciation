import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/cotroller/forgetpasswordcontroller.dart';
import 'package:ecommerce_application/cotroller/signupcontroller.dart';
import 'package:ecommerce_application/view/widget/auth/authoptions.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutomtextformauth.dart';
import 'package:ecommerce_application/view/widget/auth/logoauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "9".tr,
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
              "18".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorApp.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
             Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "22".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ColorApp.grey),
                )),
            SizedBox(
              height: 20,
            ),
            CustomTextFormAuth(
                mycontroller: controller.email,
                hint: 7,
                label: 5,
                iconData: Icons.email_outlined),
            SizedBox(
              height: 20,
            ),

            CutomButtonAuth(
                text: "19".tr,
                onPressed: () {
                  controller.ToVerifyCode();
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