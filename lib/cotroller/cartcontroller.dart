import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/cartdata.dart';
import 'package:ecommerce_application/data/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> data = [];
  double totalprice = 0.0;
  int totalitems = 0;
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.serverfailure) {
      statusRequest = StatusRequest.success;
    } else {
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          List responsedata = response['datacart'];
          Map responsedatacountprice = response['countprice'];
          data.clear();
          data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
          totalitems = int.tryParse(responsedatacountprice['totalitems'])!;
          totalprice = responsedatacountprice['totalprice'].toDouble();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  resetVarCart() {
    totalitems = 0;
    totalprice = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
