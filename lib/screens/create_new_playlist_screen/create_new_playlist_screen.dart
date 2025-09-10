import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/create_new_playlist_screen/controller/create_new_playlist_controller.dart';
import 'package:music_app/widgets/app_background_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class CreateNewPlaylistScreen extends StatefulWidget {
  const CreateNewPlaylistScreen({super.key});

  @override
  State<CreateNewPlaylistScreen> createState() =>
      _CreateNewPlaylistScreenState();
}

class _CreateNewPlaylistScreenState extends State<CreateNewPlaylistScreen> {
  final _controller = Get.put(CreateNewPlaylistController());

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonWidget.icon(
              icon: AppIcons.arrowLeftIcon,
              onTap: _controller.onGoBack,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    AppStrings.playlistName,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    textAlign: TextAlign.center,
                    cursorColor: AppColor.white_900,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.white_900),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.white_900),
                      ),
                      hintText: AppStrings.myPlaylist,
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.white_900,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          onTap: _controller.onCancel,
                          text: AppStrings.cancel,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ButtonWidget(
                          onTap: _controller.onCreate,
                          text: AppStrings.create,
                          backgroundColor: AppColor.green_900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
