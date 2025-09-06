import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/screens/splash_screen/controller/splash_controller.dart';
import 'package:music_app/widgets/app_background_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) => AppBackgroundWidget(
        body: Center(child: IconWidget(icon: AppIcons.appLogo)),
      ),
    );
  }
}
