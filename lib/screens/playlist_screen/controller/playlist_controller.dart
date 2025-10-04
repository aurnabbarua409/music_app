import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/playlist_screen/widgets/more_item.dart';
import 'package:music_app/utils/app_log.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class PlaylistController extends GetxController {
  final isSongs = true.obs;
  final commentController = TextEditingController();
  var featureArtist = <Map<String, bool>>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    featureArtist.value = [
      {"Eminuem": false},
      {"Bob Marley": false},
      {"Eminuem": false},
      {"Bob Marley": false},
    ];
  }

  void onSelectFeaturedArtist(int index) {
    final key = featureArtist[index].keys.first;
    featureArtist[index][key] = !featureArtist[index][key]!;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    commentController.dispose();
  }

  void onChangedIsSongs(bool value) {
    isSongs.value = value;

    appLog(
      title: 'After selecting playlist type',
      descrition: "Selected type: ${isSongs.value}",
    );
    update();
  }

  void onGoBack() {
    Get.back();
  }

  void onClickSong() {
    Get.toNamed(AppRoutes.nowPlayingScreen);
  }

  void onClickComments() {
    Get.bottomSheet(
      backgroundColor: AppColors.black_700,
      Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconWidget(icon: AppIcons.commentIcon),
                  SizedBox(width: 5),
                  TextWidget(
                    '24 People Comments on this post',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(color: AppColors.grey_400),
              SizedBox(height: 5),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 33.33,
                          height: 33.33,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.orange),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppImages.onBoardingCharacter1),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                  'Sane Taylor',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(width: 4),
                                TextWidget('•'),
                                SizedBox(width: 4),
                                TextWidget(
                                  '19min',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white_900,
                                ),
                              ],
                            ),

                            TextWidget(
                              'Yes, Awesome!',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white_900,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: AppStrings.writeComment,
                      controller: commentController,
                      backgroundColor: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  ButtonWidget.icon(
                    icon: AppIcons.sendIcon,
                    backgroundColor: AppColors.orange,
                    onTap: onSendComment,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSendComment() {
    appLog(title: 'After sending message', descrition: commentController.text);
    commentController.clear();
  }

  void onShowMore() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.black_700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MoreItem(
              icon: AppIcons.uploadSongIcon,
              text: AppStrings.uploadSong,
              ontap: () {
                Get.toNamed(AppRoutes.uploadNewSongScreen);
              },
            ),
            MoreItem(
              icon: AppIcons.editPlaylistIcon,
              text: AppStrings.editPlayList,
              ontap: () {
                Get.toNamed(AppRoutes.editPlaylistScreen);
              },
            ),
            MoreItem(
              icon: AppIcons.editInfoIcon,
              text: AppStrings.editInfo,
              ontap: () => Get.toNamed(AppRoutes.editInfoScreen),
            ),
            MoreItem(
              icon: AppIcons.deletePlayListIcon,
              text: AppStrings.deletePlaylist,
              ontap: deletePlaylist,
            ),
          ],
        ),
      ),
    );
  }

  void deletePlaylist() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.black_700,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconWidget(icon: AppIcons.deletePlaylistIcon1),
              SizedBox(height: 10),
              TextWidget(AppStrings.deleteDetails),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ButtonWidget.normal(
                      onTap: () {
                        Get.back();
                      },
                      text: AppStrings.cancel,
                      backgroundColor: Colors.transparent,
                      borderColor: AppColors.grey_60,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ButtonWidget.normal(
                      onTap: () {},
                      text: AppStrings.delete,
                      backgroundColor: AppColors.red_500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
