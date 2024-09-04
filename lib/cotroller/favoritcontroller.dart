
import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/functions/handlingdata.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/favoritedata.dart';
import 'package:get/get.dart';


class FavoritemController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteData favoriteData =  FavoriteData(Get.find());
  List items = [];
  MyServices myServices = Get.find();
  Map isFavorite = {};
  addDeleteFromFavorit(int id, int val) {
    isFavorite[id] = val;
    update();
  }
  addfavorite(String itemid) async {
      statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavorite(myServices.sharedPreferences.getString('id')!,itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
  deletefavorite(String itemid) async{
      statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.deleteFavorite(myServices.sharedPreferences.getString('id')!, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
     
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
