import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nilay/model/test/services.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';

class AllServicesVendorItem extends StatelessWidget {
  final Services services;
  const AllServicesVendorItem({required this.services, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildServicesItem(services);
  }

  Widget _buildServicesItem(Services services) => GestureDetector(
    child: Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
      width: 160.w,
        height: 220.r,
      decoration: BoxDecoration(
        // color: Colors.transparent.withOpacity(0.5),
          borderRadius: BorderRadiusDirectional.circular(9.r)),
      child: Stack(
        children: [
          CachedImage(
              imageUrl: services.image,
            height: 230.r),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 28.h,
              alignment: AlignmentDirectional.center,
              margin: EdgeInsetsDirectional.only(
                  bottom: 16.r, start: 10.r, end: 10.r),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadiusDirectional.circular(10.r)),
              child: AppText.medium(
                  text: services.name,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.colorAppMain),
            ),
          ),
          Container(
            width: 160.w,
              height: 220.r,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(60),
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      if(services.id == 1){
        Get.toNamed(Routes.homeStores);
      }else if(services.id == 2){
        log('wedding_halls'.tr);
        AppHelper.showToast(message: 'wedding_halls'.tr);
      }else if(services.id == 3){
        Get.toNamed(Routes.homeBeautyCenter);
      }else if(services.id == 4){
        log('photo_sessiones'.tr);
        AppHelper.showToast(message: 'photo_sessiones'.tr);
      }else if(services.id == 5){
        log('wedding_dress'.tr);
        AppHelper.showToast(message: 'wedding_dress'.tr);
      }
    },
  );
}
