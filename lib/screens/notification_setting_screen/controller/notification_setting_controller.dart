import 'package:get/get.dart';

class NotificationSettingController extends GetxController {
  final showNewPost = true.obs;
  final showNewFollowers = true.obs;
  final showMentionInGroup = true.obs;
  final showGroupActivity = true.obs;
  final showActivitiesPost = true.obs;

  void onToggleNewPost(bool value) {
    showNewPost.value = value;
    update();
  }

  void onToggleNewFollowers(bool value) {
    showNewFollowers.value = value;
    update();
  }

  void onToggleMentionInGroup(bool value) {
    showMentionInGroup.value = value;
    update();
  }

  void onToggleGroupActivity(bool value) {
    showGroupActivity.value = value;
    update();
  }

  void onToggleActivitiesPost(bool value) {
    showActivitiesPost.value = value;
    update();
  }
}
