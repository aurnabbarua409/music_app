import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';

class NewPlaylistController extends GetxController {
  final playListName = "".obs;
  final isSong = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final args = Get.arguments;
    playListName.value = args;
  }

  void onBack() {
    Get.offAllNamed(AppRoutes.bottomNavBarScreen);
  }

  void onChange(bool value) {
    isSong.value = value;
    update();
  }

  void onAddSong() {
    Get.toNamed(AppRoutes.addThisPlaylistScreen);
  }
}
