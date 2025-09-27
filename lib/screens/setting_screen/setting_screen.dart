import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/setting_screen/widget/setting_item.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_700,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.setting,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SettingItem(
              text: AppStrings.notifications,
              icon: AppIcons.bellIcon,
              ontap: () {
                Get.toNamed(AppRoutes.notificationSettingScreen);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SettingItem(
              text: AppStrings.preferences,
              icon: AppIcons.preferenceIcon,
              ontap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SettingItem(
              text: AppStrings.blockedMember,
              icon: AppIcons.preferenceIcon,
              ontap: () {},
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SettingItem(
              text: AppStrings.passwordSecurity,
              icon: AppIcons.securityIcon,
              ontap: () {
                Get.toNamed(AppRoutes.passwordSecurityScreen);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SettingItem(
              text: AppStrings.helpSupport,
              icon: AppIcons.helpIcon,
              ontap: () {
                Get.toNamed(AppRoutes.helpSupportScreen);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SettingItem(
              text: AppStrings.logout,
              icon: AppIcons.logoutIcon,
              textColor: AppColors.red_500,
              ontap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageWidget(image: AppImages.logoutNote),
                        TextWidget(
                          "Are you Sure you Want to Log Out?",
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                        TextWidget(
                          "By logging out, you will be ending your current session and will no longer have access to your account.",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey_300,
                        ),
                        ButtonWidget(onTap: () {}, text: AppStrings.logout),
                        ButtonWidget(onTap: () {}, text: "Cancel"),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
