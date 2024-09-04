import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.favoriteadd, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.favoritedelete, {"userid": userid, "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }
}
