import 'package:get/get.dart';

class TermConditionController extends GetxController {
  final terms = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    terms.value = "This is sample";
  }
}
