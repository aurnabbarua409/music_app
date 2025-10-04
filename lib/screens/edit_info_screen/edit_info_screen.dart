import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/edit_info_screen/controller/edit_info_controller.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class EditInfoScreen extends StatelessWidget {
  const EditInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditInfoController(),
      builder: (controller) {
        return AppbarWidget(
          title: AppStrings.editInfo,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  AppStrings.playlistName,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                TextFieldWidget(),
                SizedBox(height: 10),
                TextWidget(
                  AppStrings.description,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                TextFieldWidget(maxLines: 5),
                SizedBox(height: 10),
                TextWidget(
                  AppStrings.coverImage,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(
                      image: AssetImage(AppImages.music1Image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey_60),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          IconWidget(
                            icon: AppIcons.cameraIcon,
                            color: AppColors.white_900,
                          ),
                          SizedBox(width: 5),
                          TextWidget(
                            AppStrings.changeCover,
                            color: AppColors.white_900,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextWidget(
                  AppStrings.privacy,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: "Only Me",
                          activeColor: AppColors.orange,
                          groupValue: controller.privacy.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.onPrivacy(value);
                            }
                          },
                        ),
                        const TextWidget("Only Me"),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        Radio<String>(
                          value: "Private",
                          groupValue: controller.privacy.value,
                          activeColor: AppColors.orange,
                          onChanged: (value) {
                            if (value != null) {
                              controller.onPrivacy(value);
                            }
                          },
                        ),
                        const TextWidget("Public"),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                ButtonWidget(onTap: () {}, text: AppStrings.saveChange),
              ],
            ),
          ),
        );
      },
    );
  }
}
