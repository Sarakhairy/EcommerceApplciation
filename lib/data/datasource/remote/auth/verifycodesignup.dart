import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postData(
      AppLink.verifyCodeSignUp,
      {
        "email": email,
        "verifycode": verifycode,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    print("${email}================");
    var response = await crud.postData(
      AppLink.resendcode,
      {
        "email": email,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
