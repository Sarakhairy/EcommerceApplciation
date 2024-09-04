import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/cotroller/homepagecontroller.dart';

import 'package:ecommerce_application/data/datasource/remote/itemsdata.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMaxController {
  initialData();
  changeCat(int val, String catval);
  getItems(String catid);
  toProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices = Get.find();
  List categories = [];
  int? selectedcat;
  List items = [];
  String catid = "1";
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getItems(catid);
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selectedcat'];
    catid = Get.arguments['categoryid'];
  }

  @override
  changeCat(val, catval) {
    selectedcat = val;
    catid = catval;
    getItems(catid);
    update();
  }

  @override
  getItems(catid) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(catid,myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  toProductDetails(ItemsModel itemsModel) {
    Get.toNamed("productdetails", arguments: {
      "itemsmodel": itemsModel,
    });
  }
}
