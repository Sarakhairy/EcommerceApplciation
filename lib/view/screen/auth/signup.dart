import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/cotroller/signupcontroller.dart';
import 'package:ecommerce_application/view/widget/auth/authoptions.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutomtextformauth.dart';
import 'package:ecommerce_application/view/widget/auth/logoauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "11".tr,
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
              "16".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorApp.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextFormAuth(
                mycontroller: controller.username,
                hint: 13,
                label: 12,
                iconData: Icons.person_outlined),
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
            CustomTextFormAuth(
                mycontroller: controller.password,
                hint: 8,
                label: 6,
                iconData: Icons.lock_outline),
            SizedBox(
              height: 20,
            ),
            CustomTextFormAuth(
                mycontroller: controller.phone,
                hint: 14,
                label: 15,
                iconData: Icons.phone_android_outlined),
            SizedBox(
              height: 20,
            ),
            CutomButtonAuth(
                text: "11".tr,
                onPressed: () {
                  controller.SignUp();
                }),
            SizedBox(
              height: 5,
            ),
            AuthOptions(
              text: 17,
              inkWellText: 2,
              onTap: () {
                controller.ToLogIn();
              },
            )
          ],
        ),
      ),
    );
  }
}
