import 'package:get/get.dart';
import 'package:music_app/utils/app_log.dart';

class PlaylistController extends GetxController {
  final isSongs = true.obs;
  final selectedType = "".obs;
  void onChangedIsSongs(bool value) {
    isSongs.value = value;
    if (value) {
      selectedType.value = "Songs";
    } else {
      selectedType.value = "Info";
    }
    appLog(
      title: 'After selecting playlist type',
      descrition: "Selected type: ${selectedType.value}",
    );
  }
}
