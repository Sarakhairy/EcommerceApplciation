import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/functions/translatedatabase.dart';
import 'package:ecommerce_application/cotroller/itemscontroller.dart';
import 'package:ecommerce_application/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesItemsWidget extends GetView<ItemsControllerImp> {
  const CategoriesItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //   controller.toItems(
        //     controller.categories,
        //     i!
        //   );
        controller.changeCat(i!,categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
       GetBuilder<ItemsControllerImp>(builder: (controller)=>   Container(
        padding: const EdgeInsets.only(bottom:5),
            decoration: controller.selectedcat == i
                ? const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 4, color: ColorApp.primaryColor)))
                : null,
              
            child: Text("${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style: const TextStyle(
                    fontSize: 17,
                    color: ColorApp.fourthColor,
                    fontWeight: FontWeight.bold)),
          ))
        ],
      ),
    );
  }
}
