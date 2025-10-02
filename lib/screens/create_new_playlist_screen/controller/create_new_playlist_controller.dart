import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';

class CreateNewPlaylistController extends GetxController {
  late TextEditingController playlistNameController;

  void onInitial() {
    playlistNameController = TextEditingController();
  }

  void onDispose() {
    playlistNameController.dispose();
  }

  void onCancel() {
    Get.back();
  }

  void onCreate() {
    Get.offAllNamed(AppRoutes.newPlaylistScreen, arguments: playlistNameController.text);
    
  }

  void onGoBack() {
    Get.back();
  }
}
