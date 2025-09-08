import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_header_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_template_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/glassEffectContainer.dart';
import 'package:music_app/widgets/text_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthTemplateWidget(
      body: [
        AuthHeaderWidget(
          title: AppStrings.resetPassword,
          subtitle: AppStrings.resetPasswordDetails,
        ),
        TextFieldWidget(
          label: AppStrings.enterNewPassword,
          hintText: AppStrings.enterYourPassword,
        ),
        TextFieldWidget(
          label: AppStrings.confirmNewPassword,
          hintText: AppStrings.enterYourPassword,
        ),
        SizedBox(height: 30),
        GlassContainer(
          height: 50,
          child: Text("data"),
          lightingDirection: LightingDirection.topLeft,
          onTap: () {
            Get.toNamed(AppRoutes.passwordChangedScreen);
          },
          // backgroundColor: AppColor.black,
        ),
      ],
    );
  }
}
