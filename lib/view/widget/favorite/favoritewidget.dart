import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/core/constant/imageasset.dart';
import 'package:ecommerce_application/core/functions/translatedatabase.dart';
import 'package:ecommerce_application/cotroller/favoritcontroller.dart';
import 'package:ecommerce_application/cotroller/favoriteviewcontroller.dart';
import 'package:ecommerce_application/data/model/userfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteWidget extends GetView<FavoriteViewController> {
  final UserFavoriteItems userFavoriteItems;

  const FavoriteWidget({super.key, required this.userFavoriteItems});

  @override
  Widget build(BuildContext context) {
    FavoritemController favcontroller = Get.put(FavoritemController());
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: "${userFavoriteItems.itemId}",
                child: Image.asset(
                  "${ImageAsset.items}${userFavoriteItems.itemImage}",
                  height: 85,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "${translateDatabase(userFavoriteItems.itemNameAr, userFavoriteItems.itemName)}",
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
                        Text("${userFavoriteItems.itemPrice}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorApp.primaryColor,
                              fontFamily: "sans",
                            )),
                        IconButton(
                            onPressed: () {
                              controller
                                  .delete("${userFavoriteItems.favoriteId}");
                              favcontroller.addDeleteFromFavorit(
                                  userFavoriteItems.itemId!, 0);
                            },
                            icon: const Icon(Icons.delete_outline_outlined,
                                color: Colors.red))
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
