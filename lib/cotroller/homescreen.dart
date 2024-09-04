import 'package:ecommerce_application/view/screen/auth/home.dart';
import 'package:ecommerce_application/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  navigation(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<IconData> pageIcon = [
    Icons.home,
    Icons.notifications_active_outlined,
    Icons.person_pin_circle_sharp,
    Icons.settings,
  ];
  List<Widget> listPage = [
    const Home(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Favorite"),
        )
      ],
    ),
    const Settings(),
  ];
  @override
  navigation(int i) {
    currentPage = i;
    update();
  }
}
