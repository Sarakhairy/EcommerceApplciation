import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/localization/changlocal.dart';
import 'package:ecommerce_application/core/localization/translation.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/login.dart';
import 'package:ecommerce_application/view/screen/auth/resetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/signup.dart';
import 'package:ecommerce_application/view/screen/auth/successresetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/successsingup.dart';
import 'package:ecommerce_application/view/screen/auth/verifycode.dart';
import 'package:ecommerce_application/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_application/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/view/screen/onboarding.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      home: const Language(),
      routes: {
        "login": (context) => const Login(),
        "onboarding": (context)=> const onBoarding(),
        "signup": (context)=> const SignUp(),
        "forgetpassword":(context)=> const ForgetPassword(),
        "verifycode": (context) => const VerifyCode(),
        "verifycodesignup": (context) => const VerifyCodeSignUp(),
        "resetpassword" :  (context) => const ResetPassword(),
        "successresetpassword" :  (context) => const SuccessResetPassword(),
        "successsignup" :  (context) => const SuccessSingUp(),


      },
    );
  }
}
