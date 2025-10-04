import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/search_screen/controller/search_controller.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/play_list_item.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PlayListSearchController(),
      builder: (controller) {
        return AppbarWidget(
          title: AppStrings.search,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                TextFieldWidget(
                  hintText: AppStrings.search,
                  labelFontSize: 20,
                  labelFontweight: FontWeight.w700,
                  labelColor: AppColors.white,
                  borderRadius: 12,
                  borderWidth: 0.2,
                  backgroundColor: AppColors.black,
                  prefixIcon: IconWidget(icon: AppIcons.searchIcon),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                Expanded(
                  child: controller.playList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWidget(
                                icon: AppIcons.musicIcon4,
                                color: AppColors.white,
                              ),
                              SizedBox(height: 10),
                              TextWidget(
                                AppStrings.searchNoSong,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.playList.length,
                          itemBuilder: (context, index) => PlayListItem(
                            isPlaying: false,
                            image: AppImages.music1Image,
                            subtitle: "The Chainsmoker",
                            title: "Young",
                            showMore: false,

                            backgroundColor: Colors.transparent,
                            borderColor: AppColors.grey_60,
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
