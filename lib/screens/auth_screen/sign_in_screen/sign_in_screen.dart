import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/app_background_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(color: AppColor.black_900),
        child: Column(
          children: [
            IconWidget(icon: AppIcons.orangeIcon),
            SizedBox(height: 20),
            TextWidget(
              AppStrings.welcomeBack,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
            SizedBox(height: 10),
            TextWidget(
              AppStrings.signinDetails,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.white_900,
            ),
            TextFieldWidget(
              label: AppStrings.emailAdress,
              hintText: AppStrings.enterEmailAddress,
            ),
            TextFieldWidget(
              label: AppStrings.enterPassword,
              hintText: AppStrings.enterPassword,
            ),
          ],
        ),
      ),
    );
  }
}
