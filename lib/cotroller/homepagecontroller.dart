import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/homedata.dart';
import 'package:ecommerce_application/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchMaxController {
  initialData();
  getData();
  searchData();
  toItems(List categories, int selectedcat, String categoryid);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();

  String? username;

  StatusRequest statusRequest = StatusRequest.none;

  HomeData homeData = HomeData(Get.find());

  List categories = [];

  List items = [];

  String? lang;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        Get.offNamed("home");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  toItems(List categories, int selectedcat, String categoryid) {
    Get.toNamed("items", arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      "categoryid": categoryid,
    });
  }

  toProductDetails(ItemsModel itemsModel) {
    Get.toNamed("productdetails", arguments: {
      "itemsmodel": itemsModel,
    });
  }
}

class SearchMaxController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? search;
  List<ItemsModel> listData = [];
  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    print("${search!.text}==============");
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responsedata = response['data'];
        listData.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        print('${listData[0].itemName}');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
