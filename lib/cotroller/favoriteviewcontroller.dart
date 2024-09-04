import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/favoriteview.dart';
import 'package:get/get.dart';

class FavoriteViewController extends GetxController {
  FavoriteViewData favoriteViewData = FavoriteViewData(Get.find());
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  getData() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteViewData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  delete(String favoriteid) {
    update();
    var response = favoriteViewData.delete(favoriteid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      items.removeWhere((element) {
        bool res = "${element['favorite_id']}" == favoriteid;
        
        return "${element['favorite_id']}" == favoriteid;
      });

      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
