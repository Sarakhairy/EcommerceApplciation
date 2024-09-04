import 'package:ecommerce_application/core/constant/color.dart';
import 'package:ecommerce_application/cotroller/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsWidget extends GetView<ProductDetailsCollrollerImp> {
  const SubItemsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(controller.subItems.length, (index){
                        return Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 2),
                          borderRadius: BorderRadius.circular(160),
                          color: Colors.white,
                        ),
                        child:  Text("${controller.subItems[index]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color:ColorApp.fourthColor)),
                      );
                      })
                    ],
                  );
  }
}