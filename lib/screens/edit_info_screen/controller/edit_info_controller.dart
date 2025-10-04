import 'package:get/get.dart';

class EditInfoController extends GetxController {
  final privacy = "".obs;

  void onPrivacy(String value) {
    privacy.value = value;
    update();
  }
}
