import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/localization/changlocal.dart';
import 'package:ecommerce_application/core/localization/translation.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/view/screen/auth/checkemail.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/login.dart';
import 'package:ecommerce_application/view/screen/auth/resetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/signup.dart';
import 'package:ecommerce_application/view/screen/auth/successresetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/successsingup.dart';
import 'package:ecommerce_application/view/screen/auth/verifycode.dart';
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
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: ColorApp.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
              color: ColorApp.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Language(),
      routes: {
        "login": (context) => const Login(),
        "onboarding": (context)=> const onBoarding(),
        "signup": (context)=> const SignUp(),
        "forgetpassword":(context)=> const ForgetPassword(),
        "verifycode": (context) => const VerifyCode(),
        "resetpassword" :  (context) => const ResetPassword(),
        "successresetpassword" :  (context) => const SuccessResetPassword(),
        "successsignup" :  (context) => const SuccessSingUp(),
        "checkemail": (context)=> const CheckEmail(),

      },
    );
  }
}
