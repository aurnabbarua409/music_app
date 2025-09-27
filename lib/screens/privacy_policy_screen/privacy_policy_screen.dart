import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/privacy_policy_screen/controller/privacy_policy_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_700,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: Text(AppStrings.privacyPolicy),
      ),

      body: GetBuilder(
        init: PrivacyPolicyController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: HtmlWidget(
              controller.privacy.value,
              textStyle: TextStyle(color: AppColors.white),
            ),
          );
        },
      ),
    );
  }
}
