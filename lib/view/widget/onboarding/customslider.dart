import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_application/cotroller/onboardingcontroller.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPagedChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(onBoardingList[i].title!,
              style: Theme.of(context).textTheme.headlineLarge
              ),
          SizedBox(height: 50),
          Image.asset(onBoardingList[i].image!,
              width: 200, height: 230, fit: BoxFit.fill),
          SizedBox(height: 20),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                  )
                  ),
        ],
      ),
    );
  }
}
