import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imageasset.dart';
import 'package:ecommerce_application/core/functions/translatedatabase.dart';
import 'package:ecommerce_application/cotroller/homepagecontroller.dart';
import 'package:ecommerce_application/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesWidget extends GetView<HomePageControllerImp> {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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

class Categories extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel,required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toItems(
          controller.categories,
          i!,categoriesModel.categoriesId!.toString()
        );
      },
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: ColorApp.thirdColor,
                borderRadius: BorderRadius.circular(160),
              ),
              child: SvgPicture.asset(
                  "${ImageAsset.rootCategories}${categoriesModel.categoriesImage}",
                  color: ColorApp.secondaryColor)),
          const SizedBox(
            height: 5,
          ),
          Text("${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
              style: const TextStyle(
                  fontSize: 13,
                  color: ColorApp.fourthColor,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
