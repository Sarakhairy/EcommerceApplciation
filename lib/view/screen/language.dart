import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/localization/changlocal.dart';
import 'package:ecommerce_application/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(
                  height: 20,
                ),
                CustomButtonLang(
                  buttonText: "English",
                  onPressed: () {
                    controller.changelang("en");
                    Get.toNamed("onboarding");
                  },
                ),
                CustomButtonLang(
                  buttonText: "Arabic",
                  onPressed: () {
                    controller.changelang("ar");
                    Get.toNamed("onboarding");
                  },
                ),
              ],
            )));
  }
}
