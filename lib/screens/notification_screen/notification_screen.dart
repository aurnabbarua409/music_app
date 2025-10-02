import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/notification_screen/widget/notification_item.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.notifications,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget("Today", fontSize: 16, fontWeight: FontWeight.w600),
              SizedBox(height: 10),
              ...List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: NotificationItem(
                    image: AppImages.onBoardingCharacter1,
                    name: "Asad",
                    status: "liked your playlist",
                    time: "2h ago",
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextWidget(
                "Yesterday",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              ...List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: NotificationItem(
                    image: AppImages.onBoardingCharacter1,
                    name: "Asad",
                    status: "liked your playlist",
                    time: "2h ago",
                    unRead: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
