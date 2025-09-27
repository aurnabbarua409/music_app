import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_600,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: Text(AppStrings.contactUs),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextWidget(
              "Have a question or need assistance? Reach out to our support team, and we’ll get back to you as soon as possible.",
              color: AppColors.grey_300,
              textAlign: TextAlign.left,
            ),
            TextFieldWidget(label: "Name", hintText: "Enter your name"),
            TextFieldWidget(
              label: AppStrings.email,
              hintText: "Enter your email",
            ),
            TextFieldWidget(
              label: "Subject",
              hintText: "What's your inquiry about?",
            ),
            TextFieldWidget(
              label: "Message",
              maxLines: 5,
              hintText: "Tell us how we can assisi you",
            ),
            ButtonWidget(onTap: () {}, text: "Send"),
          ],
        ),
      ),
    );
  }
}
