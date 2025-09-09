import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/utils/app_log.dart';

class VerifyOtpController extends GetxController {
  late List<TextEditingController> otpController;
  late List<FocusNode> focusNode;
  final otpLength = 6;
  bool fromSignUp = false;

  void oninit() {
    appLog(
      title: 'Verify otp screen',
      descrition: "verify otp screen initialized",
    );
    otpController = List.generate(
      otpLength,
      (index) => TextEditingController(),
    );
    focusNode = List.generate(otpLength, (index) => FocusNode());
    final args = Get.arguments;
    fromSignUp = args['fromSignUp'];
  }

  void onVerify() {
    if (fromSignUp) {
      Get.toNamed(AppRoutes.homeScreen);
    }
    else {
      Get.toNamed(AppRoutes.resetPasswordScreen);
    }
  }

  void ondispose() {
    appLog(
      title: 'Verify otp screen',
      descrition: "Verify otp screen disposed",
    );
    for (int i = 0; i < otpLength; i++) {
      otpController[i].dispose();
      focusNode[i].dispose();
    }
  }
}
