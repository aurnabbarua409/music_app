import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/change_password_screen/controller/change_password_controller.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.changePassword,
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
                  labelFontSize: 16,
                  labelFontweight: FontWeight.w700,
                  labelColor: AppColors.white,
                  hintText: "Enter your password",
                  prefixIcon: IconWidget(icon: AppIcons.lockIcon),
                  borderRadius: 12,
                  borderWidth: 0.2,
                  contentPadding: EdgeInsets.all(0),
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
                  labelFontSize: 16,
                  labelFontweight: FontWeight.w700,
                  labelColor: AppColors.white,
                  hintText: "Enter your new password",
                  prefixIcon: IconWidget(icon: AppIcons.lockIcon),
                  borderRadius: 12,
                  borderWidth: 0.2,
                  contentPadding: EdgeInsets.all(0),
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
                  labelFontSize: 16,
                  labelFontweight: FontWeight.w700,
                  labelColor: AppColors.white,
                  hintText: "Re-enter your new password",
                  prefixIcon: IconWidget(icon: AppIcons.lockIcon),
                  borderRadius: 12,
                  borderWidth: 0.2,
                  contentPadding: EdgeInsets.all(0),
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
                Spacer(),
                ButtonWidget(onTap: () {}, text: AppStrings.saveChange),
              ],
            ),
          );
        },
      ),
    );
  }
}
