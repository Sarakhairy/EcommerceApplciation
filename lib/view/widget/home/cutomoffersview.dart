import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/cotroller/homepagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOffersView extends GetView<HomePageControllerImp> {
  final String title;
  final String subtitle;
  const CustomOffersView({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorApp.primaryColor,
            ),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: -40,
            right:controller.lang=="en"? -40:null,
            left:controller.lang=="ar"? -40:null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(160),
                color: ColorApp.secondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
