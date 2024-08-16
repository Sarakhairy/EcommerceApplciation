import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email,String password ) async {
    var response = await crud.postData(AppLink.logIn, {
      "email": email,
      "password": password,
    },);
    return response.fold((l) => l, (r) => r);
  }
}
