import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/profile_screen/controller/profile_controller.dart';
import 'package:music_app/screens/profile_screen/widget/profile_item_widget.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.profile,
      body: SingleChildScrollView(
        child: GetBuilder(
          init: ProfileController(),
          builder: (controller) {
            return Column(
              children: [
                Badge(
                  backgroundColor: Colors.transparent,
                  alignment: Alignment.bottomRight,
                  offset: Offset(-2, -30),
                  label: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.orange, width: 5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppImages.onBoardingCharacter1),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                TextWidget(
                  "Arman Mallik",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                TextWidget(
                  "@Arman29",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fadeWhite,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        TextWidget(
                          "1.2k",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        TextWidget(
                          "Followers",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        TextWidget(
                          "125",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        TextWidget(
                          "Followeings",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ProfileItemWidget(
                    ontap: controller.onEditProfile,
                    icon: AppIcons.editProfileIcon,
                    text: AppStrings.personalInformation,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ProfileItemWidget(
                    ontap: controller.onChangedPassword,
                    icon: AppIcons.lockIcon,
                    text: AppStrings.changePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ProfileItemWidget(
                    ontap: controller.onTermCondition,
                    icon: AppIcons.faqIcon,
                    text: AppStrings.termCondition,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ProfileItemWidget(
                    ontap: controller.onPrivacyPolicy,
                    icon: AppIcons.termIcon,
                    text: AppStrings.privacyPolicy,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ProfileItemWidget(
                    ontap: controller.onFaq,
                    icon: AppIcons.faqIcon,
                    text: AppStrings.faq,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ProfileItemWidget(
                    ontap: controller.onHelpSupport,
                    icon: AppIcons.supportIcon,
                    text: AppStrings.helpSupport,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ProfileItemWidget(
                    ontap: () {},
                    icon: AppIcons.logoutIcon,
                    text: AppStrings.logout,
                    textColor: AppColors.red_500,
                    showIcon: false,
                  ),
                ),
                SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }
}
