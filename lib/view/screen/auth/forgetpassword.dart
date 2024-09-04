
import 'package:ecommerce_application/core/constant/color.dart';

import 'package:ecommerce_application/core/functions/validinput.dart';

import 'package:ecommerce_application/cotroller/forgetpasswordcontroller.dart';


import 'package:ecommerce_application/view/widget/auth/cutombuttonauth.dart';
import 'package:ecommerce_application/view/widget/auth/cutomtextformauth.dart';

import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HadnlingDataRequest(statusRequest: controller.statusRequest,widget: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        Text(
                          "18".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: ColorApp.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "22".tr,
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
                        CutomButtonAuth(
                            text: "19".tr,
                            onPressed: () {
                              controller.CheckEmail();
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                )),
        ));
  }
}
