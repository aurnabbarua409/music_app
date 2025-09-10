import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void onCreate() {}
  void onGoBack() {
    Get.back();
  }
}
