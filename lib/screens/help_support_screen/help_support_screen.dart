import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.helpSupport,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            TextWidget(
              "Have a question or need assistance? Reach out to our support team, and we’ll get back to you as soon as possible.",
              color: AppColors.grey_300,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: "Name",
              hintText: "Enter your name",
              labelFontSize: 16,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              borderRadius: 12,
              borderWidth: 0.2,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            TextFieldWidget(
              label: AppStrings.email,
              hintText: "Enter your email",
              labelFontSize: 16,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              borderRadius: 12,
              borderWidth: 0.2,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            TextFieldWidget(
              label: "Subject",
              hintText: "What's your inquiry about?",
              labelFontSize: 16,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              borderRadius: 12,
              borderWidth: 0.2,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            TextFieldWidget(
              label: "Message",
              maxLines: 5,
              hintText: "Tell us how we can assisi you",
              labelFontSize: 16,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              borderRadius: 12,
              borderWidth: 0.2,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
            ),
            Spacer(),
            ButtonWidget(onTap: () {}, text: "Send"),
          ],
        ),
      ),
    );
  }
}
