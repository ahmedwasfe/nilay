import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/beauty_centers/album_beauty_center_controller.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class AlbumBeautyCenterScreen extends StatelessWidget {
  AlbumBeautyCenterScreen({super.key});

  final _controller = Get.put(AlbumBeautyCenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'album', color: AppColors.colorAppMain),
        centerTitle: true,
        leadingWidth: 78.w,
        leading: InkWell(
          child: SvgPicture.asset(
            AppHelper.iconBack(),
            fit: BoxFit.scaleDown,
          ),
          onTap: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: SvgPicture.asset(
                width: 24.w, height: 24.h, '${Const.icons}icon_chat.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 48.h,
              margin:
                  EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(40.r),
                  boxShadow:[
                    BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
                  ]
                 ),
              child: Row(
                children: _controller.listAlbumType.map((type) {
                  return GetBuilder<AlbumBeautyCenterController>(builder: (controller) => Expanded(
                    child: GestureDetector(
                      child: Container(
                        width: double.infinity,
                        alignment: AlignmentDirectional.center,
                        height: 48.h,
                        decoration: BoxDecoration(
                            color: type.isSelcted ? AppColors.colorAppMain : AppColors.colorWhite,
                        ),
                        child: AppText.medium(text: type.name, color: type.isSelcted ? AppColors.colorWhite : AppColors.colorAppMain),
                      ),
                      onTap: () {
                        for(var type in _controller.listAlbumType){
                          type.isSelcted = false;
                        }
                        type.isSelcted = true;
                        controller.update();
                      },
                    ),
                  ));
                }).toList(),
              ),
            ),
            Container(
              width: double.infinity,
              height: 246.h,
              clipBehavior: Clip.antiAlias,
              margin:
                  EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadiusDirectional.circular(10.r)),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  CachedImage(
                    imageUrl: Const.beautyHomeSlider1,
                    width: double.infinity,
                    height: 255.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(60),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
