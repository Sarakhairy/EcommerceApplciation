import 'package:ecommerce_application/bindings/intialbinding.dart';

import 'package:ecommerce_application/core/localization/changlocal.dart';
import 'package:ecommerce_application/core/localization/translation.dart';
import 'package:ecommerce_application/core/middleware/mymiddleware.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/view/address/view.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/home.dart';
import 'package:ecommerce_application/view/screen/auth/login.dart';
import 'package:ecommerce_application/view/screen/auth/resetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/signup.dart';
import 'package:ecommerce_application/view/screen/auth/successresetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/successsingup.dart';
import 'package:ecommerce_application/view/screen/auth/verifycode.dart';
import 'package:ecommerce_application/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_application/view/screen/cart.dart';
import 'package:ecommerce_application/view/screen/homescreen.dart';
import 'package:ecommerce_application/view/screen/items.dart';
import 'package:ecommerce_application/view/screen/language.dart';
import 'package:ecommerce_application/view/screen/productdetails.dart';
import 'package:ecommerce_application/view/screen/userfavoriteitems.dart';

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
      initialBinding: IntialBinding(),
      getPages: [
        GetPage(name: "/", page:()=> const Language(),middlewares: [
          MyMiddleWare()
        ]),
        GetPage(name: "/login", page:()=> const Login()),
        GetPage(name: "/onboarding", page:()=> const onBoarding()),
        GetPage(name:"/signup", page:()=> const SignUp()),
        GetPage(name:"/forgetpassword", page:()=>  const ForgetPassword()),
        GetPage(name:"/verifycode", page:()=> const VerifyCode()),
        GetPage(name: "/verifycodesignup", page:()=> const VerifyCodeSignUp()),
        GetPage(name:  "/resetpassword", page:()=> const ResetPassword()),
        GetPage(name:  "/successsignup", page:()=>const SuccessSingUp()),
        GetPage(name:  "/successresetpassword", page:()=>const SuccessResetPassword()),
        GetPage(name:  "/home", page:()=>const HomeScreen()),
        GetPage(name:  "/homepage", page:()=>const Home()),
        GetPage(name:  "/items", page:()=>const Items()),
        GetPage(name:  "/productdetails", page:()=> ProductDetials()),
        GetPage(name:  "/favoritepage", page:()=>const UserFavoriteItem()),
        GetPage(name:  "/cart", page:()=>const Cart()),
        GetPage(name:  "/addressview", page:()=>const AddressView()),

        
      ],
    );
  }
}
