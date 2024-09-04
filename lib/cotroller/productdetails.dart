import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/cotroller/cartcontroller.dart';
import 'package:ecommerce_application/data/datasource/remote/cartdata.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsCollrollerImp extends ProductDetailsController {
  int countitems = 0;
  StatusRequest statusRequest = StatusRequest.none;
  // CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  List subItems = [
    "red",
    "black",
    "yellow",
  ];
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  addItems(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString('id')!, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "66".tr,
            messageText: Text(
              "67".tr,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString('id')!, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "66".tr,
            messageText: Text(
              "68".tr,
              style: const TextStyle(color: Colors.grey),
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  countItems(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCount(
        myServices.sharedPreferences.getString('id')!, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;

        countitems = response['data'];
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  add() {
    addItems("${itemsModel.itemId}");
    countitems++;
    update();
  }

  delete() {
    if (countitems > 0) {
      deleteItems("${itemsModel.itemId}");
      countitems--;
      update();
    }
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments["itemsmodel"];
    countitems = await countItems("${itemsModel.itemId}");
    statusRequest = StatusRequest.success;
    update();
  }
}
