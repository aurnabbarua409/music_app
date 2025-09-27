import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/delete_account_screen/controller/delete_account_controller.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_700,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: Text(AppStrings.deleteAccount),
      ),
      body: GetBuilder(
        init: DeleteAccountController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                IconWidget(icon: AppIcons.warningIcon),
                SizedBox(height: 20),
                TextWidget(
                  'Deleting your account is permanent. All your data, including profile, photos, and saved items, will be lost. This action cannot be undone. Please confirm your password to continue.',
                  color: AppColors.grey_300,
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  obscureText: !controller.showPassword.value,
                  suffixIcon: IconButton(
                    onPressed: controller.onShowPassword,
                    color: AppColors.grey_300,
                    icon: Icon(
                      controller.showPassword.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(onTap: () {}, text: 'Cancel'),
                    ),
                    Expanded(
                      child: ButtonWidget(onTap: () {}, text: 'Confirm'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
