import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/beauty_centers/album_beauty_center_controller.dart';

class PhotosItem extends StatelessWidget {
  final _controller = Get.put(AlbumBeautyCenterController());
  final String photo;

  PhotosItem({required this.photo, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10.r)
          ),
          child: CachedNetworkImage(imageUrl: photo)),
      onTap: () {
        _controller.imageSelected = photo;
        _controller.update();
      },
    );
  }
}
