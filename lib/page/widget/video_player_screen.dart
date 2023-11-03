import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/util/print_util.dart';
import 'package:video_player/video_player.dart';

///视频播放组件
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final String videoUrl =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

  @override
  void initState() {
    PrintUtil.print("initState");
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                PrintUtil.print("ConnectionState.done");
                return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller));
              } else {
                PrintUtil.print("ConnectionState.waiting");
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Row(
            children: [
              SizedBox(width: 100.w),
              GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.w),
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 10.w, bottom: 10.w),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: const Text(
                      "Play",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () => {
                        setState(() {
                          if (!_controller.value.isPlaying) {
                            _controller.play();
                          }
                        })
                      }),
              SizedBox(width: 100.w),
              GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(top: 20.w),
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: 10.w, bottom: 10.w),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: const Text(
                        "Pause",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  onTap: () => {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          }
                        })
                      })
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
