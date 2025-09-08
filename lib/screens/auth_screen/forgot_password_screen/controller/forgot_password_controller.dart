import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  late TextEditingController emailController;

  void onConfirm() {
    Get.toNamed(AppRoutes.verifyOtpScreen);
  }
}
