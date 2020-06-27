import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoPages extends StatelessWidget {
  static const String id = "VIDEOPLAYER";

  static final videoList = [
    '/storage/emulated/0/Download/s6e22.mkv',
    '/storage/emulated/0/Download/s6e21.mkv',
    '/storage/emulated/0/Download/s6e20.mkv',
    '/storage/emulated/0/Download/s6e19.mkv',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          itemBuilder: (context, index) {
            return VideoItem(
              videoPlayerController:
                  VideoPlayerController.network(videoList[index]),
            );
          },
          itemCount: videoList.length,
        ),
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  const VideoItem({
    Key key,
    this.videoPlayerController,
  }) : super(key: key);
  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    Permission.storage.request();
    _chewieController = new ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoInitialize: true);
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chewie(controller: _chewieController),
        IconButton(icon: Icon(Icons.skip_next), onPressed: () {})
      ],
    );
  }
}
