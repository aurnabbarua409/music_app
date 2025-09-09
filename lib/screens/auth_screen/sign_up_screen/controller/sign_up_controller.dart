import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/utils/app_log.dart';

class SignUpController extends GetxController {
  final isAgreeTermCondition = false.obs;
  final isVisiblePassword = false.obs;
  final isVisibleConfirmPassword = false.obs;
  final isArtist = false.obs;
  final userType = "Regular User".obs;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  void onInitial() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    appLog(title: 'Signup', descrition: 'Signup initialized');
  }

  void onDispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    appLog(title: 'Signup', descrition: 'Signup disposed');
  }

  void onIsAgreeTermAcondition() {
    isAgreeTermCondition.value = !isAgreeTermCondition.value;
    appLog(
      title: 'Signup screen',
      descrition: 'term and condition: ${isAgreeTermCondition.value}',
    );
  }

  void onIsVisiblePassword() {
    isVisiblePassword.value = !isVisiblePassword.value;
  }

  void onIsVisibleConfirmPassword() {
    isVisibleConfirmPassword.value = !isVisibleConfirmPassword.value;
  }

  void onChooseUserType(bool value) {
    isArtist.value = value;
    if (value) {
      userType.value = "Artist";
    } else {
      userType.value = "Regular user";
    }
    appLog(
      title: 'Signup screen',
      descrition: "Choose user type: ${userType.value}",
    );
  }

  void onCreateAccount() {
    appLog(
      title: 'Signup screen on create account',
      descrition: {
        "fullname": fullNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirm password": confirmPasswordController.text,
        "term and condition": isAgreeTermCondition.value,
      },
    );
    Get.toNamed(AppRoutes.verifyOtpScreen, arguments: {'fromSignUp': true});
  }

  void onSignin() {
    Get.toNamed(AppRoutes.signInScreen);
  }
}
