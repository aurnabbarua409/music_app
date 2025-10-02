import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/routes/route_manager.dart';

class MainAppEntry extends StatelessWidget {
  const MainAppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RouteManager.getPages(),
      initialRoute: RouteManager.initial,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "SFPro"),
      themeMode: ThemeMode.dark,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
