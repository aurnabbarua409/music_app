import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/utils/app_log.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isRememberMe = false.obs;
  final isVisiblePassword = false.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onClickedRememberMe() {
    isRememberMe.value = !isRememberMe.value;
    appLog(
      title: 'signin screen',
      descrition: 'the value of isRemeberme: ${isRememberMe.value}',
    );
    update();
  }

  void onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void onIsVisiblePassword() {
    isVisiblePassword.value = !isVisiblePassword.value;
    update();
  }

  void onSignin() {
    Get.offAllNamed(AppRoutes.bottomNavBarScreen);
  }

  void onSignUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
