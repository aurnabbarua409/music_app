import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/home_screen/controller/home_controller.dart';
import 'package:music_app/screens/home_screen/widgets/daily_challenge_widget.dart';
import 'package:music_app/screens/home_screen/widgets/live_show_widget.dart';
import 'package:music_app/screens/home_screen/widgets/rising_artist_widget.dart';
import 'package:music_app/screens/home_screen/widgets/roulette_widget.dart';
import 'package:music_app/screens/home_screen/widgets/slot_machine_widget.dart';
import 'package:music_app/screens/home_screen/widgets/top_playlist_widget.dart';
import 'package:music_app/widgets/app_background_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder(
          init: HomeController(),
          builder: (controller) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.orange, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: AppColors.black,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            AppImages.onBoardingCharacter1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Aurnab Barua',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              IconWidget(icon: AppIcons.goldIcon),
                              SizedBox(width: 5),
                              TextWidget('250'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ButtonWidget.icon(
                          icon: AppIcons.notificationIcon,
                          enableGlassEffect: true,
                          onTap: () {},
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.black),
                            shape: BoxShape.circle,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // body
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SlotMachineWidget(controller: controller),
                        RouletteWidget(controller: controller),
                        SizedBox(height: 20),
                        TopPlaylistWidget(
                          title: AppStrings.topPlaylist,
                          icon: AppIcons.headphoneIcon,
                          controller: controller,
                        ),
                        RisingArtistWidget(),
                        LiveShowWidget(),
                        DailyChallengeWidget(),
                        SizedBox(height: 20),
                        TopPlaylistWidget(
                          title: AppStrings.followedPlaylist,
                          icon: AppIcons.guiterIcon,
                          controller: controller,
                        ),
                        TopPlaylistWidget(
                          title: AppStrings.recentlyAddedPlaylist,
                          icon: AppIcons.guiterIcon,
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
