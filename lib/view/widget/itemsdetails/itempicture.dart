import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imageasset.dart';
import 'package:ecommerce_application/cotroller/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPicture extends GetView<ProductDetailsCollrollerImp> {
  const ItemPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration:
                      const BoxDecoration(color: ColorApp.secondaryColor),
                ),
                Positioned(
                    top: 50.0,
                    right: 20,
                    left: 20,
                    child: Hero(
                        tag: "${controller.itemsModel.itemId}",
                        child: Image.asset(
                          "${ImageAsset.items}${controller.itemsModel.itemImage}",
                          height: 250,
                        ))),
              ],
            );
  }
}