import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/cotroller/onboardingcontroller.dart';
import 'package:ecommerce_application/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (i) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: Duration(milliseconds: 500),
                    width: controller.currentPage==i?20:6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: ColorApp.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ));
  }
}
