import 'package:flutter/cupertino.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/page/widget/video_player_screen.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<StatefulWidget> createState() => _VideoPlayerPageState();

}

class _VideoPlayerPageState extends CommonPageState<VideoPlayerPage> {
  @override
  Widget buildPageContent(BuildContext context) {
    return const VideoPlayerScreen();
  }
}