import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/notification_setting_screen/widget/notification_setting_item.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_700,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        title: Text(AppStrings.notifications),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: NotificationSettingItem(
              text: "New posts",
              onChanged: (vakue) {},
              ontap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: NotificationSettingItem(
              text: "New posts",
              onChanged: (vakue) {},
              ontap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: NotificationSettingItem(
              text: "New followers",
              onChanged: (vakue) {},
              ontap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: NotificationSettingItem(
              text: "Mentions in groups",
              onChanged: (vakue) {},
              ontap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: NotificationSettingItem(
              text: "Group activity",
              onChanged: (vakue) {},
              ontap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: NotificationSettingItem(
              text: "Activities on your posts",
              onChanged: (vakue) {},
              ontap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
