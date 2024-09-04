
import 'package:ecommerce_application/core/constant/color.dart';

import 'package:ecommerce_application/core/functions/validinput.dart';

import 'package:ecommerce_application/cotroller/passwordcontroller.dart';
import 'package:ecommerce_application/cotroller/signupcontroller.dart';
import 'package:ecommerce_application/view/widget/auth/authoptions.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutomtextformauth.dart';

import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    final PasswordController passcontroller = Get.put(PasswordController());
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
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HadnlingDataRequest(statusRequest: controller.statusRequest,widget:Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        Text(
                          "16".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: ColorApp.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 5, 40, "username");
                          },
                          mycontroller: controller.username,
                          hint: 13,
                          label: 12,
                          iconData: Icons.person_outlined,
                          type: 'username',
                          obscuretext: false,
                          enablesuggestions: true,
                          autoCorrect: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          hint: 7,
                          label: 5,
                          iconData: Icons.email_outlined,
                          type: 'email',
                          obscuretext: false,
                          enablesuggestions: true,
                          autoCorrect: true,
                        ),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 8, 15, "phone");
                          },
                          mycontroller: controller.phone,
                          hint: 14,
                          label: 15,
                          iconData: Icons.phone_android_outlined,
                          type: 'phone',
                          obscuretext: false,
                          enablesuggestions: true,
                          autoCorrect: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CutomButtonAuth(
                            text: "11".tr,
                            onPressed: () {
                              controller.SignUp();
                            }),
                        const SizedBox(
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
                )),
        ));
  }
}
