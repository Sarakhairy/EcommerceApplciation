import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/functions/validinput.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/cotroller/forgetpasswordcontroller.dart';
import 'package:ecommerce_application/cotroller/passwordcontroller.dart';
import 'package:ecommerce_application/cotroller/resetcodecontroller.dart';
import 'package:ecommerce_application/cotroller/signupcontroller.dart';
import 'package:ecommerce_application/view/widget/auth/authoptions.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutomtextformauth.dart';
import 'package:ecommerce_application/view/widget/auth/logoauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    final PasswordController passcontroller = Get.put(PasswordController());
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
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HadnlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: Form(
                  key: controller.formstate,
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
                      Obx(() => CustomTextFormAuth(
                            valid: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            mycontroller: controller.password,
                            hint: 8,
                            label: 6,
                            iconData: passcontroller.isObscured.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            type: 'password',
                            obscuretext: passcontroller.isObscured.value,
                            enablesuggestions: false,
                            autoCorrect: false,
                            onPressed: passcontroller.toggleObscureText,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() => CustomTextFormAuth(
                            valid: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            mycontroller: controller.repassword,
                            hint: 8,
                            label: 6,
                            iconData: passcontroller.isObscured.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            type: 'password',
                            obscuretext: passcontroller.isObscured.value,
                            enablesuggestions: false,
                            autoCorrect: false,
                            onPressed: passcontroller.toggleObscureText,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CutomButtonAuth(
                          text: "19".tr,
                          onPressed: () {
                            controller.resetpassword();
                          }),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
