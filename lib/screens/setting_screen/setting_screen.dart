import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/setting_screen/widget/setting_item.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.setting,    
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
                Get.bottomSheet(
                  backgroundColor: AppColors.black_700,
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageWidget(
                            image: AppImages.logoutNote,
                            height: 150,
                            width: 150,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          TextWidget(
                            "Are you Sure you Want to Log Out?",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                          SizedBox(height: 10),
                          TextWidget(
                            "By logging out, you will be ending your current session and will no longer have access to your account.",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey_300,
                          ),
                          SizedBox(height: 10),
                          ButtonWidget(
                            onTap: () {
                              Get.offAllNamed(AppRoutes.signInScreen);
                            },
                            text: AppStrings.logout,
                          ),
                          ButtonWidget(
                            onTap: () {
                              Get.back();
                            },
                            text: "Cancel",
                            backgroundColor: AppColors.black,
                            cardColor: Colors.transparent,
                            enableGlassEffect: false,
                            borderColor: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
