import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoPages extends StatefulWidget {
  static const String id = "VIDEOPLAYER";

  static final videoList = [
    '/storage/emulated/0/Download/s6e19.mkv',
    '/storage/emulated/0/Download/s6e22.mkv',
    '/storage/emulated/0/Download/s6e21.mkv',
    '/storage/emulated/0/Download/s6e20.mkv',
    '/storage/emulated/0/Download/s6e18.mkv',
    '/storage/emulated/0/Download/s6e17.mkv',
    '/storage/emulated/0/Download/s6e16.mkv',
    '/storage/emulated/0/Download/s6e15.mkv',
    '/storage/emulated/0/Download/s6e14.mkv',
    '/storage/emulated/0/Download/s6e19.mkv',
    '/storage/emulated/0/Download/s6e22.mkv',
    '/storage/emulated/0/Download/s6e21.mkv',
    '/storage/emulated/0/Download/s6e20.mkv',
    '/storage/emulated/0/Download/s6e18.mkv',
    '/storage/emulated/0/Download/s6e17.mkv',
    '/storage/emulated/0/Download/s6e16.mkv',
    '/storage/emulated/0/Download/s6e15.mkv',
    '/storage/emulated/0/Download/s6e14.mkv',
  ];

  @override
  _VideoPagesState createState() => _VideoPagesState();
}

class _VideoPagesState extends State<VideoPages> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return VideoItem(
                videoPlayerController:
                    VideoPlayerController.network(VideoPages.videoList[index]),
                playNext: () {
                  setState(() {
                    if (index == VideoPages.videoList.length - 1) {
                      pageController.jumpToPage(0);
                      index = 0;
                    } else {
                      index = index + 1;
                      pageController.animateToPage(index,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.ease);
                    }
                    print(index);
                  });
                });
          },
          itemCount: VideoPages.videoList.length,
        ),
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final VoidCallback playNext;
  const VideoItem({
    Key key,
    this.videoPlayerController,
    this.playNext,
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
    initializePlayer();
  }

  initializePlayer() {
    _chewieController = new ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoInitialize: true);
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _chewieController.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chewie(controller: _chewieController),
        IconButton(
            icon: Icon(Icons.skip_next),
            onPressed: () => {
                  widget.playNext(),
                })
      ],
    );
  }
}
