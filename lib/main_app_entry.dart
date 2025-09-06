import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/route_manager.dart';

class MainAppEntry extends StatelessWidget {
  const MainAppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RouteManager.getPages(),
      initialRoute: RouteManager.initial,
      debugShowCheckedModeBanner: false,
    );
  }
}
