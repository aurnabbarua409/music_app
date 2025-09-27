import 'package:get/get.dart';

class PrivacyPolicyController extends GetxController {
  final privacy = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    privacy.value = "This is sample";
  }
}
