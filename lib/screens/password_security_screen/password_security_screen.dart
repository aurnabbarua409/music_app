import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/password_security_screen/widget/password_security_item.dart';

class PasswordSecurityScreen extends StatelessWidget {
  const PasswordSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_700,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        title: Text(AppStrings.passwordSecurity),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: PasswordSecurityItem(
              text: AppStrings.changePassword,
              icon: AppIcons.lockIcon,
              fontColor: AppColors.grey_300,
              ontap: () {
                Get.toNamed(AppRoutes.changePasswordSceen);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: PasswordSecurityItem(
              text: 'Delete Account',
              fontColor: AppColors.red_500,
              icon: AppIcons.trashIcon,

              ontap: () {
                Get.toNamed(AppRoutes.deleteAccountSceen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
