import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/cotroller/successresetpasswordcontroller.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "31".tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: ColorApp.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
                child: Icon(Icons.check_circle_outline,
                    size: 200, color: ColorApp.primaryColor)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "32".tr,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: CutomButtonAuth(
                  text: "33".tr,
                  onPressed: () {
                    controller.ToLogin();
                  }),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
