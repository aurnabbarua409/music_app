import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/notification_setting_screen/controller/notification_setting_controller.dart';
import 'package:music_app/screens/notification_setting_screen/widget/notification_setting_item.dart';
import 'package:music_app/widgets/appbar_widget.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.notifications,
      body: GetBuilder(
        init: NotificationSettingController(),
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: NotificationSettingItem(
                  text: "New posts",
                  onChanged: (vakue) {},
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: NotificationSettingItem(
                  text: "New followers",
                  onChanged: (vakue) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: NotificationSettingItem(
                  text: "Mentions in groups",
                  onChanged: (vakue) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: NotificationSettingItem(
                  text: "Group activity",
                  onChanged: (vakue) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: NotificationSettingItem(
                  text: "Activities on your posts",
                  onChanged: (vakue) {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
