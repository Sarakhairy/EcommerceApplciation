import 'package:ecommerce_application/core/constant/color.dart';

import 'package:ecommerce_application/core/functions/translatedatabase.dart';
import 'package:ecommerce_application/cotroller/productdetails.dart';
import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:ecommerce_application/view/widget/itemsdetails/item_price_quantity.dart';
import 'package:ecommerce_application/view/widget/itemsdetails/itempicture.dart';
import 'package:ecommerce_application/view/widget/itemsdetails/subitemswidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetials extends StatelessWidget {
  ProductDetials({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsCollrollerImp controller =
        Get.put(ProductDetailsCollrollerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          color: ColorApp.secondaryColor,
          child: MaterialButton(
            onPressed: () {
              Get.toNamed('cart');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Text(
              "Go to cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsCollrollerImp>(builder: (controller) {
          return HadnlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView(
                children: [
                  const ItemPicture(),
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${translateDatabase(controller.itemsModel.itemNameAr, controller.itemsModel.itemName)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 10, 42, 69)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ItemPriceQuantity(
                          price: "${controller.itemsModel.itemPriceDicount!.truncate()}",
                          priceBefDisc: "${controller.itemsModel.itemPrice!.truncate()}",
                          discount: controller.itemsModel.itemDiscount!,
                          count: "${controller.countitems}",
                          add: () {
                            controller.add();
                          },
                          delete: () {
                            controller.delete();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("${controller.itemsModel.itemDesc}"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Color",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 10, 42, 69)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SubItemsWidget(),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
