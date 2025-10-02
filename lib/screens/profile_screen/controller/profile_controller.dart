import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';

class ProfileController extends GetxController {
  void onEditProfile() {
    Get.toNamed(AppRoutes.editProfileScreen);
  }

  // sfpro
  void onChangedPassword() {
    Get.toNamed(AppRoutes.changePasswordSceen);
  }

  void onTermCondition() {
    Get.toNamed(AppRoutes.termConditionScreen);
  }

  void onPrivacyPolicy() {
    Get.toNamed(AppRoutes.privacyPolicyScreen);
  }

  void onFaq() {
    Get.toNamed(AppRoutes.faqScreen);
  }

  void onHelpSupport() {
    Get.toNamed(AppRoutes.helpSupportScreen);
  }
}
