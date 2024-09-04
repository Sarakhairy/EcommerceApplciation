
import 'package:ecommerce_application/core/constant/color.dart';

import 'package:ecommerce_application/core/functions/validinput.dart';

import 'package:ecommerce_application/cotroller/logincontroller.dart';
import 'package:ecommerce_application/cotroller/passwordcontroller.dart';
import 'package:ecommerce_application/view/widget/auth/authoptions.dart';
import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutomtextformauth.dart';
import 'package:ecommerce_application/view/widget/auth/logoauth.dart';

import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    final PasswordController passcontroller = Get.put(PasswordController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "2".tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: ColorApp.grey),
          ),
        ),
        body: GetBuilder<LoginControllerImp>(
          builder: (controller)=>
               HadnlingDataRequest(statusRequest: controller.statusRequest,widget:  Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        const LogoAuth(),
                        Text(
                          "3".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: ColorApp.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "4".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: ColorApp.grey),
                            )),
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
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: InkWell(
                            onTap: () {
                              controller.ToForgetPassword();
                            },
                            child: Text(
                              "9".tr,
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CutomButtonAuth(
                            text: "2".tr,
                            onPressed: () {
                              controller.Login();
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        AuthOptions(
                          text: 10,
                          inkWellText: 11,
                          onTap: () {
                            controller.ToSignUp();
                          },
                        )
                      ],
                    ),
                  ),
                )),
        ));
  }
}
