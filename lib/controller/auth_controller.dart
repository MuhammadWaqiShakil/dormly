import 'package:get/get.dart';

class AuthController extends GetxController{

  static RxBool isLoading = false.obs;
  static RxBool obscurePassword = true.obs;

  static void changeObscure() {
    obscurePassword.value = !obscurePassword.value;
  }
}