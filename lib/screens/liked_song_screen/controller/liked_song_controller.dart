import 'package:get/get.dart';

class LikedSongController extends GetxController {
  final title = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title.value = Get.arguments;
  }
}
