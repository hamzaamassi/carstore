import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  late YoutubePlayerController youtubePlayerController;
  bool _isFullScreen = false;
  bool _autoPlayEnabled = true;

  @override
  void onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: 'nPt8bK2gbaU', // Replace with your video ID
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        loop: true,
      ),
    );
  }

  void playVideo() {
    youtubePlayerController.play();
  }

  void pauseVideo() {
    youtubePlayerController.pause();
  }

  void toggleFullScreen() {
    if (_isFullScreen) {
      SystemChrome.restoreSystemUIOverlays();
      _isFullScreen = false;
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      _isFullScreen = true;
    }
    update();
  }

  void toggleAutoPlay(bool enable) {
    _autoPlayEnabled = enable;
    youtubePlayerController.load(_getVideoId());
    update();
  }

  String _getVideoId() {
    return youtubePlayerController.metadata.videoId;
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }
}
