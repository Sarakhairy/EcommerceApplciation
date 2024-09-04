import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"userid": userid, "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"userid": userid, "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }
  getCount(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartgetcountitems, {"userid": userid, "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }
   viewCart(String userid) async {
    var response = await crud
        .postData(AppLink.cartview, {"userid": userid,});

    return response.fold((l) => l, (r) => r);
  }
}
