import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/playlist_screen/controller/playlist_controller.dart';
import 'package:music_app/screens/playlist_screen/widgets/feature_artist_button.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/play_list_item.dart';
import 'package:music_app/widgets/playlist_header_widget.dart';
import 'package:music_app/widgets/text_widget.dart';
import 'package:music_app/widgets/type_selector_widget.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PlaylistController(),
      builder: (controller) {
        return AppbarWidget(
          title: AppStrings.playlist,
          leading: ButtonWidget.icon(
            icon: AppIcons.arrowLeftIcon,
            backgroundColor: Colors.transparent,
            cardColor: Colors.transparent,
            onTap: controller.onGoBack,
          ),
          actions: [
            ButtonWidget.icon(
              icon: AppIcons.saveIcon,
              backgroundColor: Colors.transparent,
              cardColor: Colors.transparent,
              onTap: () {},
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // PlaylistAppbarWidget(controller: controller),
                SizedBox(height: 30),
                PlaylistHeaderWidget(
                  duration: '1h 30m',
                  numberOfSong: "8",
                  owner: "Aurnab",
                  playlistName: "Summer vibes 2025",
                  viewer: "12.5K",
                  image: AppImages.onBoardingCharacter1,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ButtonWidget.icon(
                      icon: AppIcons.loveIcon,
                      enableGlassEffect: false,
                      cardColor: Colors.transparent,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      onTap: () {},
                    ),
                    TextWidget(
                      '23',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
                    ),

                    SizedBox(width: 10),
                    ButtonWidget.icon(
                      icon: AppIcons.commentIcon,
                      enableGlassEffect: false,
                      cardColor: Colors.transparent,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      onTap: controller.onClickComments,
                    ),
                    TextWidget(
                      '24',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
                    ),
                    Spacer(),
                    ButtonWidget(
                      onTap: () {},
                      width: 100,
                      height: 38,
                      iconPosition: IconPosition.beforeText,
                      text: AppStrings.follow,
                      fontSize: 14,
                      backgroundColor: Colors.transparent,
                      cardColor: Colors.transparent,
                      fontWeight: FontWeight.w600,
                      icon: AppIcons.addPeopleIcon,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TypeSelectorWidget(
                  height: 56,
                  value: controller.isSongs.value,
                  onChanged: controller.onChangedIsSongs,
                  firstText: AppStrings.songs,
                  lastText: AppStrings.info,
                  lastIcon: AppIcons.infoIcon2,
                  firstIcon: AppIcons.songIcon,
                ),

                SizedBox(height: 20),
                controller.isSongs.value
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => PlayListItem(
                            isPlaying: index == 1,
                            title: "Young",
                            subtitle: "The chainsmoker",
                            image: AppImages.music1Image,
                            ontap: controller.onClickSong,
                            onShowMore: controller.onShowMore,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget(
                              "About this playlist",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget(
                              "Sun-soaked beats and late-night synths for balmy evenings by the shore. Handpicked for 2025 with fresh EDM-pop, mellow house, and indie-electro gems.",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white_900,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget(
                              "Featured Artist",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              spacing: 15,
                              runSpacing: 15,
                              children: List.generate(
                                controller.featureArtist.length,
                                (index) => FeatureArtistButton(
                                  text: controller
                                      .featureArtist[index]
                                      .keys
                                      .first,
                                  isSelected: controller
                                      .featureArtist[index]
                                      .values
                                      .first,
                                  ontap: () =>
                                      controller.onSelectFeaturedArtist(index),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
