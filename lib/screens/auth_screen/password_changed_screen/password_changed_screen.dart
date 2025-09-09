import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_header_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_template_widget.dart';
import 'package:music_app/widgets/button_widget.dart';

class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthTemplateWidget(
      body: [
        AuthHeaderWidget(
          isPasswordChanged: true,
          title: AppStrings.passwordChanged,
          subtitle: AppStrings.passwordChangedDetails,
        ),
        SizedBox(height: 20),
        ButtonWidget(
          onTap: () {
            Get.toNamed(AppRoutes.signInScreen);
          },
          text: AppStrings.backToLogin,
          width: double.infinity,
        ),
      ],
    );
  }
}
