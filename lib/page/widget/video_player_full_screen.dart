import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/util/print_util.dart';
import 'package:video_player/video_player.dart';

///全屏视频播放组件
class VideoPlayerFullScreen extends StatefulWidget {
  const VideoPlayerFullScreen({super.key});

  @override
  State<StatefulWidget> createState() => _VideoPlayerFullScreenState();
}

class _VideoPlayerFullScreenState extends State<VideoPlayerFullScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  final String videoUrl =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

  @override
  void initState() {
    PrintUtil.print("initState");
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
    );
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      // 视频宽高比
      aspectRatio: 16 / 9,
      // 自动播放
      autoPlay: true,
      fullScreenByDefault: true,
      // 循环播放
      looping: false,
      // 允许全屏
      allowFullScreen: true,
      // 允许静音
      allowMuting: false,
      // customControls: const MaterialControls()
      // 其他 Chewie 控制器属性可以在此设置
    );
    _controller.setLooping(false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
