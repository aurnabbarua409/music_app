import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';

class SignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RxBool isRememberMe = false.obs;

  void onClickedRememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  void onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void onSignin() {}
}
