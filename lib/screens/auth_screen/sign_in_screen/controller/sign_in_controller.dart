import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/utils/app_log.dart';

class SignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RxBool isRememberMe = false.obs;
  final isVisiblePassword = false.obs;

  void onInitial() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    appLog(title: 'Signin', descrition: 'initialized');
  }

  void onDispose() {
    emailController.dispose();
    passwordController.dispose();
    appLog(title: 'signin', descrition: 'disposed');
  }

  void onClickedRememberMe() {
    isRememberMe.value = !isRememberMe.value;
    appLog(
      title: 'signin screen',
      descrition: 'the value of isRemeberme: ${isRememberMe.value}',
    );
  }

  void onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void onIsVisiblePassword() {
    isVisiblePassword.value = !isVisiblePassword.value;
  }

  void onSignin() {
    Get.offAllNamed(AppRoutes.bottomNavBarScreen);
  }

  void onSignUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
