import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imageasset.dart';
import 'package:ecommerce_application/core/functions/translatedatabase.dart';
import 'package:ecommerce_application/cotroller/favoritcontroller.dart';
import 'package:ecommerce_application/cotroller/itemscontroller.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsWidget extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final bool active;
  const ItemsWidget(
      {super.key, required this.itemsModel, required this.active});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toProductDetails(itemsModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
          children: [
            Card(
        child: 
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: "${itemsModel.itemId}",
                    child: Image.asset(
                      "${ImageAsset.items}${itemsModel.itemImage}",
                      height: 85,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    "${translateDatabase(itemsModel.itemNameAr, itemsModel.itemName)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorApp.fourthColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Rating ",
                        style: TextStyle(
                            fontSize: 13,
                            color: ColorApp.fourthColor,
                            fontFamily: 'sans',
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Color.fromARGB(255, 249, 227, 30),
                                  ))
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("${itemsModel.itemPriceDicount!.truncate()}\$",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorApp.primaryColor,
                                      fontFamily: "sans",
                                    )),
                                    SizedBox(width: 5,),
                                    itemsModel.itemDiscount! > 0? Container(
                                      height: 15,
                  alignment: Alignment.bottomRight,
                                      child: Text("${itemsModel.itemPrice!.truncate()}\$",style: TextStyle(
                                        fontSize: 10,
                                        decoration: TextDecoration.lineThrough
                                      ),),
                                    ):Text(" "),
                              ],
                            ),
                            GetBuilder<FavoritemController>(builder: (controller) {
                              return IconButton(
                                  alignment: Alignment.bottomRight,
                                  onPressed: () {
                                    if (controller.isFavorite[itemsModel.itemId] ==
                                        1) {
                                      controller.deletefavorite("${itemsModel.itemId!}");
                                      controller.addDeleteFromFavorit(
                                          itemsModel.itemId!, 0);
                                    } else {
                                      controller.addfavorite("${itemsModel.itemId!}");
                                      controller.addDeleteFromFavorit(
                                          itemsModel.itemId!, 1);
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemId] == 1
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: Colors.red,
                                  ));
                            })
                          ]),
                    ],
                  ),
                ],
              ),
            ),
        ),
        itemsModel.itemDiscount! > 0? Positioned(
              top: -20,
              right:  -20,
              child: Image.asset(ImageAsset.sale,width: 100)):Text(" ")
          ],
      ),
    );
  }
}
