import 'package:get/get.dart';

class PasswordController extends GetxController {
  var isObscured = true.obs; // Observable variable to track visibility

  void toggleObscureText() {
    isObscured.value = !isObscured.value;
  }
}