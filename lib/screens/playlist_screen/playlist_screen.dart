import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/playlist_screen/controller/playlist_controller.dart';
import 'package:music_app/screens/playlist_screen/widgets/icon_button_widget.dart';
import 'package:music_app/screens/playlist_screen/widgets/play_list_item.dart';
import 'package:music_app/screens/playlist_screen/widgets/playlist_appbar_widget.dart';
import 'package:music_app/screens/playlist_screen/widgets/playlist_header_widget.dart';
import 'package:music_app/widgets/app_background_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/text_widget.dart';
import 'package:music_app/widgets/type_selector_widget.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final _controller = Get.put(PlaylistController());
  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            PlaylistAppbarWidget(),
            SizedBox(height: 30),
            PlaylistHeaderWidget(),
            SizedBox(height: 20),
            Obx(
              () => TypeSelectorWidget(
                value: _controller.isSongs.value,
                onChanged: _controller.onChangedIsSongs,
                firstText: AppStrings.songs,
                lastText: AppStrings.info,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) =>
                    PlayListItem(isPlaying: index == 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
