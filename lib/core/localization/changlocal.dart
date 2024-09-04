import 'package:ecommerce_application/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_application/core/constant/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeData? appTheme;
  MyServices myServices = Get.find();
  changelang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme!);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    if (myServices.sharedPreferences.getString("lang") == "ar") {
      language = const Locale("ar");
      appTheme = arabicTheme;
    } else if (myServices.sharedPreferences.getString("lang") == "en") {
      language = const Locale("en");
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (Get.deviceLocale!.languageCode == "ar") {
        appTheme = arabicTheme;
      } else {
        appTheme = englishTheme;
      }
    }
    super.onInit();
  }
}
