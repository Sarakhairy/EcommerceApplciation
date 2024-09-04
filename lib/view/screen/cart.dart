import 'package:ecommerce_application/cotroller/cartcontroller.dart';
import 'package:ecommerce_application/cotroller/productdetails.dart';
import 'package:ecommerce_application/view/widget/cart/appbarcart.dart';
import 'package:ecommerce_application/view/widget/cart/bottomnavigationbar.dart';
import 'package:ecommerce_application/view/widget/cart/cartitemswidget.dart';
import 'package:ecommerce_application/view/widget/cart/numberofitems.dart';
import 'package:ecommerce_application/view/widget/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
       ProductDetailsCollrollerImp proController =
        Get.put(ProductDetailsCollrollerImp());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
      return BottomNavigationBarCart(
        price: "${controller.totalprice}",
        shipping: "300",
        totalprice: "${controller.totalprice + 300}",
      );
    }), body: GetBuilder<CartController>(builder: (controller) {
      return HadnlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView(
          children: [
            const AppBarCart(title: 'Cart'),
            const SizedBox(
              height: 10,
            ),
            NumberofItems(
              message: "You have ${controller.totalitems} items in your cart",
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ...List.generate(
               cartController.data.length,
                      (index) => CartItemsWidget(
                            add: () async{
                              await proController
                                  .addItems("${controller.data[index].itemId!}");
                              cartController.refreshPage();
                            },
                            delete: () async{
                              await proController.deleteItems(
                                  "${cartController.data[index].itemId!}");
                              cartController.refreshPage();
                            },
                            imagename:
                                "${cartController.data[index].itemImage}",
                            count: "${cartController.data[index].countitems}",
                            price: "${cartController.data[index].itemprice}\$",
                            name: "${cartController.data[index].itemName}",
                          ))
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
