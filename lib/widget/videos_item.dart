import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/beauty_centers/album_beauty_center_controller.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/constants.dart';

class VideoItem extends StatefulWidget {
  final String video;

  VideoItem({required this.video, super.key});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  final _controller = Get.put(AlbumBeautyCenterController());

  String? urlVideo;

  @override
  void initState() {
    _controller.getVideoThumbnail(widget.video).then((value) {
      setState(() {
        urlVideo = value;
      });
      log('getVideoThumbnail:: $urlVideo');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context)  {
    return GestureDetector(
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10.r)
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              urlVideo != null ? Image.file(File(urlVideo!)) : Image.network(Const.appLogo),
              IconButton(onPressed: (){
                setState(() {
                  _controller.videoSelected = widget.video;
                });

                log('videoSelected:: ${_controller.videoSelected}');
                _controller.update();
              }, icon: const Icon(Icons.play_circle_fill_outlined,
                  size: 35,
                  color: AppColors.colorWhite))
            ],
          )),
      onTap: () {
        // setState(() {
        //   _controller.videoSelected = widget.video;
        // });
        //
        // log('videoSelected:: ${_controller.videoSelected}');
        // _controller.update();
      },
    );
  }
}
