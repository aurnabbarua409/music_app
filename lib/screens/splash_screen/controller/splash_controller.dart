import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.onBoardingScreen);
    });
  }
}
