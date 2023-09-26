import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/beauty_centers/album_beauty_center_controller.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/widget/photos_item.dart';

class VideosPage extends StatelessWidget {

  final _controller = Get.put(AlbumBeautyCenterController());
  VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlbumBeautyCenterController>(builder: (controller) => Container(
      // color: Colors.amber.withOpacity(0.3),
      child: Column(
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
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                GetBuilder<AlbumBeautyCenterController>(builder: (controller) => CachedImage(
                  imageUrl: controller.videoSelected,
                  width: double.infinity,
                  height: 240.h,
                )),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(60),
                  ),
                ),
              ],
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
              itemBuilder: (BuildContext context, int index) => PhotosItem(photo: _controller.listVideos[index]),
            ),
          ),
        ],
      ),
    ));
  }
}
