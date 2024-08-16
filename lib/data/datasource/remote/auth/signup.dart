import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String username,String email,String password , String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "user": username,
      "email": email,
      "password": password,
      "phone": phone,
    },);
    return response.fold((l) => l, (r) => r);
  }
}
