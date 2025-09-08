import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/widgets/app_background_widget.dart';
import 'package:music_app/widgets/button_widget.dart';

class AuthTemplateWidget extends StatelessWidget {
  const AuthTemplateWidget({
    super.key,
    required this.body,
    this.showLeading = true,
  });
  final List<Widget> body;
  final bool showLeading;
  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLeading)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ButtonWidget.icon(
                onTap: () {
                  Get.back();
                },
                icon: AppIcons.arrowLeftIcon,
              ),
            ),
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: AppColor.black_900,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, children: body),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
