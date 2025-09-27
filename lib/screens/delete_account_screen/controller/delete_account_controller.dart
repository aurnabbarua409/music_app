import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  final showPassword = false.obs;

  void onShowPassword() {
    showPassword.value = !showPassword.value;
    update();
  }
}
