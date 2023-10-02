import 'dart:developer';
import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/beauty_centers/album_beauty_center_controller.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/photos_item.dart';
import 'package:nilay/widget/videos_item.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideosPage extends StatefulWidget {


  VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  final _controller = Get.put(AlbumBeautyCenterController());

  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  String? urlVideo;

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    super.initState();
    setState(() {
      log('initState:: ${_controller.videoSelected}');
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(_controller.videoSelected))
        ..initialize().then((value) => setState(() {
        }));
      _customVideoPlayerController = CustomVideoPlayerController(
          context: context,
          videoPlayerController: videoPlayerController,
          customVideoPlayerSettings: const CustomVideoPlayerSettings(
            playbackSpeedButtonAvailable: true,
            settingsButtonAvailable: true,
            customVideoPlayerProgressBarSettings: CustomVideoPlayerProgressBarSettings(
                showProgressBar: true,
                allowScrubbing: true
            ),
            autoFadeOutControls: true,
            controlBarAvailable: true,
            alwaysShowThumbnailOnVideoPaused: true,
            showSeekButtons: true,
            pauseButton: Icon(Icons.pause_circle_rounded),
            playButton: Icon(Icons.play_circle),
          )
      );
    });


  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlbumBeautyCenterController>(builder: (controller) => Column(
      children: [
        Container(
          width: double.infinity,
          height: 220.h,
          clipBehavior: Clip.antiAlias,
          margin:
          EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadiusDirectional.circular(10.r)),
          child: CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
          child: MasonryGridView.count(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 16,
            itemCount: _controller.listVideos.length,
            itemBuilder: (BuildContext context, int index) => VideoItem(video: _controller.listVideos[index]),
          ),
        ),
      ],
    ));
  }

}
