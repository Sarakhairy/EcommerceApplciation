import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class FavoriteViewData {
  Crud crud;
  FavoriteViewData(this.crud);
  getData(String id) async {
    var response = await crud.postData(
      AppLink.favoritview,
      {"id": id},
    );
    return response.fold((l) => l, (r) => r);
  }

  delete(String id) async {
    print("id ===============================");
    var response = await crud.postData(
      AppLink.deletefromfavoritepage,
      {"id": id},
    );
    return response.fold((l) => l, (r) => r);
  }
}
