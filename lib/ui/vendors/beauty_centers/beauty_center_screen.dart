import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/vendors/beauty_centers/beauty_center_item.dart';
import 'package:ready/ready.dart';

class BeautyCenterScreen extends StatelessWidget {

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
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 12.r),
            child: SvgPicture.asset(
                width: 24.w, height: 24.h, '${Const.icons}icon_chat.svg'),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsetsDirectional.only(end: 28.r),
              child: SvgPicture.asset(
                  width: 24.w, height: 24.h, '${Const.icons}icon_cart.svg'),
            ),
            onTap: () => Get.toNamed(Routes.cartStores),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                    height: 48.r,
                    margin:
                    EdgeInsetsDirectional.only(start: 10.r, top: 6.r, end: 10.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              top: 10.5,
                              right: 0,
                              child: SvgPicture.asset(
                                  height: 10, '${Const.icons}icon_shape_polygon.svg'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 35.r,
                                  height: 18.r,
                                  decoration: BoxDecoration(
                                      color: AppColors.colorWhite,
                                      borderRadius:
                                      BorderRadiusDirectional.circular(16.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset('${Const.icons}icon_star.svg'),
                                      AppText.medium(
                                          text: vendor!.rate,
                                          color: AppColors.colorAppMain,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400)
                                    ],
                                  ),
                                ),
                                Container(
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
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
