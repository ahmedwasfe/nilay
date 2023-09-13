import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/favorite_controller.dart';
import 'package:nilay/model/vendor_data.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class FavoritePage extends StatelessWidget {

  final _controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'favorite', color: AppColors.colorAppMain),
        centerTitle: true,
        leadingWidth: 78.w,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 20.r),
          child: CircleAvatar(
            backgroundColor: AppColors.colorAppMain,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(100.r)
              ),
              child: CachedImage(
                isLoading: false,
                  fit: BoxFit.scaleDown,
                  imageUrl: AppHelper.getCurrentUser()!.photo!),
            ),
          ),
        ),
        actions: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: Stack(
              // alignment: AlignmentDirectional.topEnd,
              children: [
                SvgPicture.asset(
                    width: 24.w,
                    height: 24.h,
                    AppHelper.iconNotification()),
                Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 0.r, start: 13.0.r),
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadiusDirectional.circular(50.r)
                  ),
                  child: AppText.medium(text: '8',
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 30.r, start: 20.r, end: 20.r),
              child: AppText.medium(text: 'top_favorite', color: AppColors.colorAppMain),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 30.r, start: 10.r, end: 20.r),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _controller.listTopFavorites.map((vendor) => _buildTopFavoriteItem(vendor)).toList(),
                ),
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 30.r, start: 20.r, end: 20.r),
              child: AppText.medium(text: 'your_favourite', color: AppColors.colorAppMain),
            ),
            _controller.listFavorites.isNotEmpty
                ? Container(
              margin: EdgeInsetsDirectional.only(top: 30.r, start: 14.r, end: 14.r, bottom: 0.r),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.listFavorites.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 16,
                    childAspectRatio: 120 / 150,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => _buildFavoriteItem(_controller.listFavorites[index])),
            )
                : Center(
              child: Column(
                children: [
                  Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50.r),
                      border: Border.all(color: AppColors.colorAppMain, width: 1.r)
                    ),
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      margin: EdgeInsetsDirectional.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.colorAppSub,
                          borderRadius: BorderRadiusDirectional.circular(50.r),

                      ),
                      child: SvgPicture.asset('${Const.icons}icon_favorite_empty.svg',
                      fit: BoxFit.scaleDown),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 40.r),
                    child: AppText.medium(text: 'dont_have_favourite', color: AppColors.colorTextMain),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopFavoriteItem(VendorData vendor) => Container(
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
    width: 272.w,
    height: 159.r,
    decoration: BoxDecoration(
      // color: Colors.transparent.withOpacity(0.5),
        borderRadius: BorderRadiusDirectional.circular(9.r)
    ),
    child: Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        CachedImage(imageUrl: vendor.image),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            width: 150,
            height: 30.h,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsetsDirectional.only(bottom: 16.r, start: 10.r, end: 10.r),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadiusDirectional.circular(10.r)
            ),
            child: AppText.medium(text: vendor.name, fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.colorAppMain),
          ),
        ),
        Container(
          width: 272.w,
          height: 159.r,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(60),
          ),
        ),
        Container(
          height: 48.r,
          // color: Colors.cyan,
          margin: EdgeInsetsDirectional.only(start: 10.r, top: 6.r, end: 10.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppHelper.getVenderMembership(vendor.membership)),
              const Spacer(),
              Stack(
                children: [
                  Positioned(
                    top: 10.5,
                    right: 0,
                    child: SvgPicture.asset(
                        height: 10,
                        '${Const.icons}icon_shape_polygon.svg'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 35.r,
                        height: 18.r,
                        decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadiusDirectional.circular(16.r)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('${Const.icons}icon_star.svg'),
                            AppText.medium(text: vendor.rate, color: AppColors.colorAppMain, fontSize: 10.sp, fontWeight: FontWeight.w400)
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
                              borderRadius: BorderRadiusDirectional.circular(50.r)
                          ),
                          child: SvgPicture.asset(AppHelper.isFavorite(vendor.isFavorite))),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildFavoriteItem(VendorData vendor) => Container(
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
    decoration: BoxDecoration(
      // color: Colors.transparent.withOpacity(0.5),
        borderRadius: BorderRadiusDirectional.circular(9.r)
    ),
    child: Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        CachedImage(imageUrl: vendor.image,
          width: 180.w,
          height: 234.r,),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 28.h,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsetsDirectional.only(bottom: 16.r, start: 10.r, end: 10.r),
            padding: EdgeInsetsDirectional.only(start: 4.r),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadiusDirectional.circular(10.r)
            ),
            child: AppText.medium(text: vendor.name, fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.colorAppMain),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(60),
          ),
        ),
        Container(
          height: 48.r,
          // color: Colors.cyan,
          margin: EdgeInsetsDirectional.only(start: 10.r, top: 6.r, end: 10.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppHelper.getVenderMembership(vendor.membership)),
              const Spacer(),
              Stack(
                children: [
                  Positioned(
                    top: 10.5,
                    right: 0,
                    child: SvgPicture.asset(
                        height: 10,
                        '${Const.icons}icon_shape_polygon.svg'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 35.r,
                        height: 18.r,
                        decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadiusDirectional.circular(16.r)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('${Const.icons}icon_star.svg'),
                            AppText.medium(text: vendor.rate, color: AppColors.colorAppMain, fontSize: 10.sp, fontWeight: FontWeight.w400)
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
                              borderRadius: BorderRadiusDirectional.circular(50.r)
                          ),
                          child: SvgPicture.asset(AppHelper.isFavorite(vendor.isFavorite))),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),

      ],
    ),
  );

}