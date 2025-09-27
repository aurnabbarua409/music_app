import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/help_support_screen/widget/help_support_item.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_700,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: Text(AppStrings.helpSupport),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: HelpSupportItem(
              ontap: () {
                Get.toNamed(AppRoutes.aboutAppScreen);
              },
              icon: AppIcons.infoIcon,
              text: AppStrings.aboutApp,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: HelpSupportItem(
              ontap: () {
                Get.toNamed(AppRoutes.faqScreen);
              },
              icon: AppIcons.faqIcon,
              text: AppStrings.faq,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: HelpSupportItem(
              ontap: () {
                Get.toNamed(AppRoutes.termConditionScreen);
              },
              icon: AppIcons.termIcon,
              text: AppStrings.termCondition,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: HelpSupportItem(
              ontap: () {
                Get.toNamed(AppRoutes.privacyPolicyScreen);
              },
              icon: AppIcons.termIcon,
              text: AppStrings.privacyPolicy,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: HelpSupportItem(
              ontap: () {
                Get.toNamed(AppRoutes.contactUsScreen);
              },
              icon: AppIcons.termIcon,
              text: AppStrings.contactUs,
            ),
          ),
        ],
      ),
    );
  }
}
