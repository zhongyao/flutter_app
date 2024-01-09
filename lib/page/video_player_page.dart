import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/page/widget/video_player_screen.dart';

class VideoPlayerPage extends ConsumerStatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPlayerPageState();

}

class _VideoPlayerPageState extends CommonPageState<VideoPlayerPage> {
  @override
  Widget buildPageContent(BuildContext context) {
    return const VideoPlayerScreen();
  }
}