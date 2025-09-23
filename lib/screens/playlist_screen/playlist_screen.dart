import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/playlist_screen/controller/playlist_controller.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/play_list_item.dart';
import 'package:music_app/screens/playlist_screen/widgets/playlist_appbar_widget.dart';
import 'package:music_app/screens/playlist_screen/widgets/playlist_header_widget.dart';
import 'package:music_app/widgets/app_background_widget.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitial();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            PlaylistAppbarWidget(controller: _controller),
            SizedBox(height: 30),
            PlaylistHeaderWidget(),
            SizedBox(height: 20),
            Obx(
              () => TypeSelectorWidget(
                height: 56,
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
                itemBuilder: (context, index) => PlayListItem(
                  isPlaying: index == 1,
                  ontap: _controller.onClickSong,
                ),
              ),
            ),
            SizedBox(height: 10),
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
                  onTap: _controller.onClickComments,
                ),
                TextWidget(
                  '24',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white_900,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
