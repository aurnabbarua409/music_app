import 'package:get/get.dart';
import 'package:music_app/models/playlist_model.dart';

class PlayListSearchController extends GetxController {
  final playList = <PlaylistModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     playList.value = [
      PlaylistModel(
        playListName: "The Chainsmokers",
        numberofSong: "8",
        duration: "2h",
        owner: "Young",
        totalView: "50K",
      ),
      PlaylistModel(
        playListName: "The Chainsmokers",
        numberofSong: "8",
        duration: "2h",
        owner: "Young",
        totalView: "50K",
      ),
      PlaylistModel(
        playListName: "The Chainsmokers",
        numberofSong: "8",
        duration: "2h",
        owner: "Young",
        totalView: "50K",
      ),
      PlaylistModel(
        playListName: "The Chainsmokers",
        numberofSong: "8",
        duration: "2h",
        owner: "Young",
        totalView: "50K",
      ),
    ];
  }
}
