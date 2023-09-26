import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:nilay/controller/vendors/beauty_centers/beauty_center_controller.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/vendors/experts_vendor_item.dart';
import 'package:nilay/widget/vendors/services_vendor_item.dart';

class BeautyCenterScreen extends StatelessWidget {

  final _controller = Get.put(BeautyCenterController());
  VendorData? vendor;

 BeautyCenterScreen({this.vendor, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            vendor!.membership == Const.KEY_MEMBERSHIP_SILVER
                ? Container(
              margin: EdgeInsetsDirectional.only(bottom: 24.r),
              child: SvgPicture.asset(
                AppHelper.getVenderMembership(vendor!.membership, true), color: Colors.grey.withOpacity(0.4),),
            )
                : Container(
              margin: EdgeInsetsDirectional.only(bottom: 24.r),
              child: SvgPicture.asset(
                  AppHelper.getVenderMembership(vendor!.membership, true)),
            ),
            vendor!.name.length < 10
                ? Marquee(
              text: vendor!.name,
              style: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.colorAppMain, fontFamily: Const.appFont),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            )
                : Expanded(
              child: Container(
                  margin: EdgeInsetsDirectional.zero,
                  child: AppText.medium(text: vendor!.name, color: AppColors.colorAppMain, maxline: 1)),
            ),
          ],
        ),
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
          GestureDetector(
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: EdgeInsetsDirectional.only(end: 20.r),
              child: SvgPicture.asset(
                  width: 24.w, height: 24.h, '${Const.icons}icon_chat.svg'),
            ),
            onTap: () => Get.toNamed(Routes.chat),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 193.h,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadiusDirectional.circular(10.r)),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  CachedImage(
                    imageUrl: vendor!.image,
                    width: double.infinity,
                    height: 234.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 28.h,
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsetsDirectional.only(
                          bottom: 16.r, start: 10.r, end: 10.r),
                      padding: EdgeInsetsDirectional.only(start: 4.r),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadiusDirectional.circular(10.r)),
                      child: AppText.medium(
                          text: 'Special offers on all hair dye',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorAppMain),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(60),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.topEnd,
                    height: 48.r,
                    margin:
                    EdgeInsetsDirectional.only(start: 10.r, top: 6.r, end: 10.r),
                    child: Container(
                        width: 20.r,
                        height: 20.r,
                        margin: EdgeInsetsDirectional.only(top: 7.r),
                        padding: EdgeInsetsDirectional.all(4.r),
                        decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius:
                            BorderRadiusDirectional.circular(50.r)),
                        child: SvgPicture.asset(
                            AppHelper.isFavorite(vendor!.isFavorite))),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(
                  text: 'Rosa Beauty Salon is a salon that specializes in providing beauty, skin, hair and nail care services. ',
              fontWeight: FontWeight.w400,
              maxline: 4),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('${Const.icons}icon_star.svg', width: 24.w, height: 24.h),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText.medium(text: 'ratings', fontSize: 14.sp),
                            SizedBox(width: 4.w),
                            SvgPicture.asset('${Const.icons}icon_add_rate.svg')
                          ],
                        )
                      ],
                    ),
                    onTap: () => _controller.showRatingDialog(context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('${Const.icons}icon_show_address.png', width: 24.w, height: 24.h),
                      SizedBox(height: 10.h),
                      AppText.medium(text: 'address', fontSize: 14.sp),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('${Const.icons}icon_available_times.jpg', width: 24.w, height: 24.h),
                      SizedBox(height: 10.h),
                      AppText.medium(text: 'available', fontSize: 14.sp),
                    ],
                  ),
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('${Const.icons}icon_album.png', width: 24.w, height: 24.h),
                        SizedBox(height: 10.h),
                        AppText.medium(text: 'album', fontSize: 14.sp),
                      ],
                    ),
                    onTap: () => Get.toNamed(Routes.albumBeautyCenter),
                  )
                ],
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 30.r, start: 20.r, end: 20.r),
              child: Row(
                children: [
                  Expanded(
                      child: AppText.medium(
                          text: 'services',
                          color: AppColors.colorAppMain)),
                  GestureDetector(
                    child: AppText.medium(
                        text: 'see_all',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.colorAppMain),
                    onTap: () => Get.toNamed(Routes.allBeautyCenterServices),
                  ),
                ],
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 30.r, start: 10.r, end: 20.r),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _controller.listServices
                      .map((services) => ServicesVendorItem(services: services))
                      .toList(),
                ),
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 30.r, start: 20.r, end: 20.r),
              child: Row(
                children: [
                  Expanded(
                      child: AppText.medium(
                          text: 'experts',
                          color: AppColors.colorAppMain)),
                  GestureDetector(
                    child: AppText.medium(
                        text: 'see_all',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.colorAppMain),
                    onTap: () => Get.toNamed(Routes.allBeautyCenterExperts),
                  ),
                ],
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 30.r, start: 10.r, end: 20.r, bottom: 20.r),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _controller.listServices
                      .map((services) => ExpertsVendorItem(services: services))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}