import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imageasset.dart';
import 'package:ecommerce_application/core/functions/translatedatabase.dart';
import 'package:ecommerce_application/cotroller/homepagecontroller.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsWidget extends GetView<HomePageControllerImp> {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            );
          }),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Image.asset(
          "${ImageAsset.items}${itemsModel.itemImage}",
          height: 100,
          width: 150,
          fit: BoxFit.fill,
        ),
      ),
      Container(
        height: 120,
        width: 200,
        color: ColorApp.black.withOpacity(0.3),
      ),
      Positioned(
        child: Text(
          "${translateDatabase(itemsModel.itemNameAr, itemsModel.itemName)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      )
    ]);
  }
}
