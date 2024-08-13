import 'package:ecommerce_application/cotroller/onboardingcontroller.dart';
import 'package:ecommerce_application/data/datasource/static/static.dart';
import 'package:ecommerce_application/view/widget/onboarding/custombutton.dart';
import 'package:ecommerce_application/view/widget/onboarding/dotcontroller.dart';
import 'package:ecommerce_application/view/widget/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:get/get.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10),
          child: SafeArea(
              child: Column(
            children: [
              Expanded(
                flex: 3,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    DotControllerOnBoarding(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtonOnBoarding(),
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
