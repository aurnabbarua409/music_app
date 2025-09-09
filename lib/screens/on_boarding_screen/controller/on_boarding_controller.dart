import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/utils/app_log.dart';
import 'package:music_app/widgets/image_widget.dart';

class OnBoardingController extends GetxController {
  late CarouselSliderController carouseSliderController;
  final currentIndex = 1.obs;
  final List<Widget> images = [
    ImageWidget(image: AppImages.onBoardingCharacter1),
    ImageWidget(image: AppImages.onBoardingCharacter1),
    ImageWidget(image: AppImages.onBoardingCharacter1),
  ];

  void changeCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void onClickedLetsGo() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    carouseSliderController = CarouselSliderController();
    appLog(title: 'On boarding screen', descrition: 'initialized');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    appLog(title: 'On boarding screen', descrition: 'disposed');
  }
}
