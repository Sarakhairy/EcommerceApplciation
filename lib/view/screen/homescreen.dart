import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/cotroller/homescreen.dart';
import 'package:ecommerce_application/view/widget/home/cutomebuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorApp.primaryColor,
            onPressed: () {},
            child: IconButton(
                onPressed: () {
                  Get.toNamed('cart');
                },
                icon: const Icon(Icons.shopping_basket_outlined)),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length, ((index) {
                    return CutomeButtonAppBar(
                      icon: controller.pageIcon[index],
                      onPressed: () {
                        controller.navigation(index);
                      },
                      active: controller.currentPage == index ? true : false,
                    );
                  })),
                ],
              )),
          body: controller.listPage.elementAt(controller.currentPage)),
    );
  }
}
