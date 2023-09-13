import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/home_page_controller.dart';
import 'package:nilay/model/services.dart';
import 'package:nilay/model/slider.dart';
import 'package:nilay/model/vendor_data.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'home', color: AppColors.colorAppMain),
        centerTitle: true,
        leadingWidth: 78.w,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 20.r),
          child: CircleAvatar(
            backgroundColor: AppColors.colorAppMain,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(100.r)),
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
                    width: 24.w, height: 24.h, AppHelper.iconNotification()),
                Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 0.r, start: 13.0.r),
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadiusDirectional.circular(50.r)),
                  child: AppText.medium(
                      text: '8',
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
                  EdgeInsetsDirectional.only(top: 28.r, start: 20.r, end: 20.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.colorAppMain,
                cursorWidth: 1.3.w,
                cursorRadius: const Radius.circular(32).r,
                enabled: true,
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    fontFamily: Const.appFont,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'search'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.colorTextSub2,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    fillColor: const Color(0xffFFFFFF),
                    filled: true,
                    helperMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightGray, width: 0.2.w),
                      borderRadius: BorderRadius.circular(32).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.colorBlack, width: 0.2.w),
                      borderRadius: BorderRadius.circular(32).r,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 48.h,
                      minWidth: 48.w,
                    ),
                    prefixIcon: SvgPicture.asset(
                        '${Const.icons}icon_search.svg',
                        fit: BoxFit.scaleDown),
                    suffixIcon: SvgPicture.asset(
                        '${Const.icons}icon_filter.svg',
                        fit: BoxFit.scaleDown)),
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              margin:
                  EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 30.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r)),
              child: ImageSlideshow(
                width: 360,
                height: 195,
                initialPage: 0,
                indicatorRadius: 5,
                indicatorColor: Colors.transparent,
                indicatorBackgroundColor: Colors.transparent,
                autoPlayInterval: 5000,
                isLoop: true,
                children: _controller.listSlider
                    .map((silder) => _buildSliderItem(silder))
                    .toList(),
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 30.r, start: 20.r, end: 20.r),
              child: AppText.medium(
                  text: 'services', color: AppColors.colorAppMain),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 30.r, start: 10.r, end: 20.r),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _controller.listServices
                      .map((services) => _buildServicesItem(services))
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
                          text: 'top_five', color: AppColors.colorAppMain)),
                  AppText.medium(
                      text: 'see_all',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.colorAppMain),
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
                  children: _controller.listVendors
                      .map((vendor) => _buildVendorItem(vendor))
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
                          text: 'recent_visited',
                          color: AppColors.colorAppMain)),
                  AppText.medium(
                      text: 'see_all',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.colorAppMain),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: 30.r, start: 10.r, end: 20.r, bottom: 20.r),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _controller.listVendorsRecent
                      .map((vendor) => _buildVendorItem(vendor))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderItem(SliderData slider) => InkWell(
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10.r)),
          child: CachedImage(imageUrl: slider.image!),
        ),
        onTap: () {},
      );

  Widget _buildServicesItem(Services services) => Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
        width: 130.w,
        height: 145.61.r,
        decoration: BoxDecoration(
            // color: Colors.transparent.withOpacity(0.5),
            borderRadius: BorderRadiusDirectional.circular(9.r)),
        child: Stack(
          children: [
            CachedImage(
                imageUrl: services.image, width: 140.w, height: 155.61.r),
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
              width: 130.w,
              height: 145.61.r,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(60),
              ),
            ),
          ],
        ),
      );

  Widget _buildVendorItem(VendorData vendor) => Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
        width: 140.w,
        height: 207.04.r,
        decoration: BoxDecoration(
            // color: Colors.transparent.withOpacity(0.5),
            borderRadius: BorderRadiusDirectional.circular(9.r)),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CachedImage(
              width: 144.w,
              height: 215.04.r,
              imageUrl: vendor.image,
            ),
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
                    text: vendor.name,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorAppMain),
              ),
            ),
            Container(
              width: 140.w,
              height: 207.04.r,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(60),
              ),
            ),
            Container(
              height: 48.r,
              // color: Colors.cyan,
              margin:
                  EdgeInsetsDirectional.only(start: 10.r, top: 6.r, end: 10.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                      AppHelper.getVenderMembership(vendor.membership)),
                  const Spacer(),
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
                                    text: vendor.rate,
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
                                  AppHelper.isFavorite(vendor.isFavorite))),
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

/*
* TODO USER DATA
* GetBuilder<HomePageController>(builder: (controller) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppHelper.getCurrentUserToken() != null ? Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(AppHelper.getCurrentUser()!.photo != null ? AppHelper.getCurrentUser()!.photo! : Const.defaultUserImage),
                ),
                const SizedBox(height: 20),
                AppText.medium(text: AppHelper.getCurrentUser()!.name != null ? AppHelper.getCurrentUser()!.name! : 'No Name'),
                const SizedBox(height: 10),
                AppText.medium(text: AppHelper.getCurrentUser()!.email != null ? AppHelper.getCurrentUser()!.provider == 'Phone Number' ? AppHelper.getCurrentUser()!.mobile! : AppHelper.getCurrentUser()!.email! : 'No Email'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(text: AppHelper.getCurrentUser()!.provider != null ? 'Logged By: ' : 'No Logged',
                        fontWeight: FontWeight.w500),
                    AppText.medium(text: AppHelper.getCurrentUser()!.provider != null ? ' ${AppHelper.getCurrentUser()!.provider}' : 'No Logged',
                        fontWeight: FontWeight.w600, color: Colors.green),
                  ],
                ),
              ],
            ) : Container(),
            const SizedBox(height: 20),
            AppWidgets.CustomButton(
                text: AppHelper.getCurrentUserToken() != null ? 'Log Out' : 'Login',
                radius: 8,
                width: 150.w,
                isUpperCase: false,
                click: () {
                  PreferencesManager.clearData(key: Const.KEY_USER_DATA)
                      .then((value) {
                    PreferencesManager.clearData(key: Const.KEY_USER_TOKEN);
                    Get.toNamed(Routes.signIn);
                  });
                }),
          ],
        ),
      ))
* */
