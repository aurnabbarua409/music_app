import 'package:get/get.dart';

class AboutAppController extends GetxController {
  final aboutApp = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    aboutApp.value = "This is sample";
  }
}
