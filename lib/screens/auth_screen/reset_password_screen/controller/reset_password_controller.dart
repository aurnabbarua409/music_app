import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  final isVisibleNewPassword = false.obs;
  final isVisibleConfirmPassword = false.obs;

  void onClickedIsVisibleNewPassword() {
    isVisibleNewPassword.value = !isVisibleNewPassword.value;
  }

  void onClickedIsVisibleConfirmPassword() {
    isVisibleConfirmPassword.value = !isVisibleConfirmPassword.value;
  }

  void onInitial() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void onUpdatePassword() {
    Get.toNamed(AppRoutes.passwordChangedScreen);
  }

  void onDispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
