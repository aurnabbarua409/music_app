import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.profile,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Badge(
              offset: Offset(-15, -15),
              backgroundColor: Colors.transparent,
              alignment: Alignment.bottomRight,
              label: ButtonWidget.icon(
                icon: AppIcons.cameraIcon,
                color: AppColors.black,
                backgroundColor: AppColors.orange,
                onTap: () {},
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: ImageWidget(
                  image: AppImages.onBoardingCharacter1,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextFieldWidget(
              label: "First Name",
              labelFontSize: 16,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              hintText: "Enter your first name",
              prefixIcon: IconWidget(icon: AppIcons.userIcon),
              borderRadius: 12,
              borderWidth: 0.2,
              contentPadding: EdgeInsets.all(0),
            ),
            TextFieldWidget(
              label: "Last Name",
              labelFontSize: 16,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              hintText: "Enter your last name",
              prefixIcon: IconWidget(icon: AppIcons.userIcon),
              borderRadius: 12,
              borderWidth: 0.2,
              contentPadding: EdgeInsets.all(0),
            ),
            TextFieldWidget(
              label: "Username",
              labelFontSize: 16,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              hintText: "Create an unique username",
              prefixIcon: IconWidget(icon: AppIcons.userIcon),
              borderRadius: 12,
              borderWidth: 0.2,
              contentPadding: EdgeInsets.all(0),
            ),
            TextFieldWidget(
              label: "Email",
              labelFontSize: 16,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              hintText: "Enter your email",
              prefixIcon: IconWidget(icon: AppIcons.emailIcon),
              borderRadius: 12,
              borderWidth: 0.2,
              contentPadding: EdgeInsets.all(0),
            ),
            Spacer(),
            ButtonWidget(onTap: () {}, text: AppStrings.saveChange),
          ],
        ),
      ),
    );
  }
}
