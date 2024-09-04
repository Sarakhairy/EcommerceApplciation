
import 'package:ecommerce_application/cotroller/favoriteviewcontroller.dart';
import 'package:ecommerce_application/data/model/userfavorite.dart';
import 'package:ecommerce_application/view/widget/favorite/favoritewidget.dart';
import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:ecommerce_application/view/widget/home/cutomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFavoriteItem extends StatelessWidget {
  const UserFavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteViewController());
    return Scaffold(body: Container(
      padding: const  EdgeInsets.all(15),
        child: GetBuilder<FavoriteViewController>(builder: (controller) {
      return ListView(
        children: [
          // CutomAppBar(
          //   searchHint: 62,
          //   onPressedFavorite: () {
          //     Get.toNamed("favoritepage");
          //   },
          // ),
          const SizedBox(
            height: 20,
          ),
          HadnlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemBuilder: (context, index) {
                return FavoriteWidget(
                  userFavoriteItems:
                      UserFavoriteItems.fromJson(controller.items[index]),
                  
                  
                );
              },
            ),
          )
        ],
      );
    })));
  }
}
