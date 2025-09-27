import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/change_password_screen/controller/change_password_controller.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_700,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: Text(AppStrings.changePassword),
      ),
      body: GetBuilder(
        init: ChangePasswordController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFieldWidget(
                  label: 'Current Password',
                  backgroundColor: AppColors.black,
                  obscureText: controller.showCurrentPassword.value,
                  suffixIcon: IconButton(
                    onPressed: controller.onCurrentPassword,
                    color: AppColors.grey_300,
                    icon: Icon(
                      !controller.showCurrentPassword.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                TextFieldWidget(
                  label: 'New Password',
                  backgroundColor: AppColors.black,
                  obscureText: controller.showNewPassword.value,
                  suffixIcon: IconButton(
                    onPressed: controller.onNewPAssword,
                    color: AppColors.grey_300,
                    icon: Icon(
                      !controller.showNewPassword.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                TextFieldWidget(
                  label: 'Confirm Password',
                  backgroundColor: AppColors.black,
                  obscureText: controller.showConfirmPassword.value,
                  suffixIcon: IconButton(
                    onPressed: controller.onConfirmPassword,
                    color: AppColors.grey_300,
                    icon: Icon(
                      !controller.showConfirmPassword.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ButtonWidget(onTap: () {}, text: AppStrings.update),
              ],
            ),
          );
        },
      ),
    );
  }
}
