import 'dart:ui';

import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final showCurrentPassword = true.obs;
  final showNewPassword = true.obs;
  final showConfirmPassword = true.obs;

  void onCurrentPassword() {
    showCurrentPassword.value = !showCurrentPassword.value;
    update();
  }

  void onNewPAssword() {
    showNewPassword.value = !showNewPassword.value;
    update();
  }

  void onConfirmPassword() {
    showConfirmPassword.value = !showConfirmPassword.value;
    update();
  }
}
