import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/utils/app_log.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    appLog(title: 'Splash screen', descrition: 'initialized');
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.onBoardingScreen);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    appLog(title: 'Splash screen', descrition: 'disposed');
  }
}
