import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/filter/filtter_controller.dart';
import 'package:nilay/model/test/categories.dart';
import 'package:nilay/model/test/rating.dart';
import 'package:nilay/model/test/sales.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class FilterAllStoresScreen extends StatelessWidget {
  FilterAllStoresScreen({super.key});

  final _controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'filter', color: AppColors.colorAppMain),
        centerTitle: true,
        leadingWidth: 78.w,
        leading: InkWell(
          child: SvgPicture.asset(
            AppHelper.iconBack(),
            fit: BoxFit.scaleDown,
          ),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(text: 'categories'),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 16.r),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    GetBuilder<FilterController>(builder: (controller) => GestureDetector(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(end: 10.r, bottom: 4.r),
                        padding: EdgeInsetsDirectional.only(start: 24.r, top: 8.r, end: 24.r, bottom: 8.r),
                        decoration: BoxDecoration(
                            color: _controller.categorySelected == 0 ? AppColors.colorAppMain : AppColors.colorOtherBG,
                            borderRadius: BorderRadiusDirectional.circular(40.r)
                        ),
                        child: AppText.medium(text: 'All', color: _controller.categorySelected == 0 ? AppColors.colorWhite : AppColors.colorBlack, fontWeight: _controller.categorySelected == 0 ? FontWeight.w400 : FontWeight.w300, fontSize: 14.sp),
                      ),
                      onTap: () {
                        for(var category in controller.listCategories){
                          category.isSelected = false;
                        }
                        _controller.categorySelected = 0;
                        controller.update();
                      },
                    )),
                    Row(
                      children: _controller.listCategories.map((category) => _buildCategoryItem(category)).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(text: 'sales'),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 10.r, end: 20.r, top: 16.r),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: _controller.listSales.map((sale) => _buildSaleItem(sale)).toList(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(text: 'rating'),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 16.r),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    GetBuilder<FilterController>(builder: (controller) => GestureDetector(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(end: 10.r, bottom: 4.r),
                        padding: EdgeInsetsDirectional.only(start: 14.r, top: 8.r, end: 24.r, bottom: 8.r),
                        decoration: BoxDecoration(
                            color: _controller.ratingSelected == 0 ? AppColors.colorAppMain : AppColors.colorOtherBG,
                            borderRadius: BorderRadiusDirectional.circular(40.r)
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('${Const.icons}icon_star.svg', width: 14.w, height: 14.h),
                            SizedBox(width: 8.r),
                            AppText.medium(text: 'all', color: _controller.ratingSelected == 0 ? AppColors.colorWhite : AppColors.colorBlack, fontWeight: _controller.ratingSelected == 0 ? FontWeight.w400 : FontWeight.w300, fontSize: 14.sp),
                          ],
                        ),
                      ),
                      onTap: () {
                        for(var rate in controller.listRating){
                          rate.isSelected = false;
                        }
                        _controller.ratingSelected = 0;
                        controller.update();
                      },
                    )),
                    Row(
                      children: _controller.listRating.map((rate) => _buildRateItem(rate)).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(text: 'time_'),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 16.r),
              child: Row(
                children: [
                  SvgPicture.asset('${Const.icons}icon_filter_location.svg'),
                  SizedBox(width: 14.h),
                  Expanded(child: AppText.medium(text: 'online')),
                  GetBuilder<FilterController>(builder: (controller) {
                    return FlutterSwitch(
                      width: 68.w,
                      height: 30.h,
                      valueFontSize: 25.0,
                      toggleSize: 24.r,
                      value: _controller.isOnline,
                      borderRadius: 20.r,
                      padding: 4.r,
                      showOnOff: false,
                      activeColor: AppColors.colorAppMain,
                      inactiveColor: AppColors.colorTextSub2,
                      onToggle: (val) {
                        _controller.isOnline = val;
                        _controller.update();
                      },
                    );
                  }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(text: 'location'),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 16.r),
              child: Row(
                children: [
                  SvgPicture.asset('${Const.icons}icon_filter_online.svg'),
                  SizedBox(width: 14.h),
                  Expanded(child: AppText.medium(text: 'nearby_places')),
                  GetBuilder<FilterController>(builder: (controller) {
                    return FlutterSwitch(
                      width: 68.w,
                      height: 30.h,
                      valueFontSize: 25.0,
                      toggleSize: 24.r,
                      value: _controller.isNearbyPlaces,
                      borderRadius: 20.r,
                      padding: 4.r,
                      showOnOff: false,
                      activeColor: AppColors.colorAppMain,
                      inactiveColor: AppColors.colorTextSub2,
                      onToggle: (val) {
                        _controller.isNearbyPlaces = val;
                        _controller.update();
                      },
                    );
                  }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(text: 'price_range'),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 0.r, end: 0.r, top: 16.r),
              child: GetBuilder<FilterController>(builder: (controller) => RangeSlider(
                values: controller.currentRangeValues,
                max: 80,
                divisions: 80,
                min: 10,
                activeColor: AppColors.colorAppMain,
                inactiveColor: AppColors.colorAppSub,
                labels: RangeLabels(
                  '${controller.currentRangeValues.start.round().toString()}\$',
                  '${controller.currentRangeValues.end.round().toString()}\$',
                ),
                onChanged: (RangeValues values) {
                  controller.currentRangeValues = values;
                  log('_currentRangeValues: ${controller.currentRangeValues.start} / ${controller.currentRangeValues.end}');
                  controller.update();
                },
              )),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 45.r),
              child: Row(
                children: [
                  Expanded(
                    child: AppWidgets.CustomButton(
                        text: 'reset',
                        width: 120.w,
                        height: 48.h,
                        isUpperCase: false,
                        background: AppColors.colorGray1,
                        borderColor: AppColors.colorGray1,
                        textColor: AppColors.colorAppMain,
                        fontWeight: FontWeight.w400,
                        radius: 40.r,
                        click: () {}),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: AppWidgets.CustomButton(
                        text: 'apply',
                        width: 120.w,
                        height: 48.h,
                        isUpperCase: false,
                        background: AppColors.colorAppMain,
                        borderColor: AppColors.colorAppMain,
                        textColor: AppColors.colorWhite,
                        fontWeight: FontWeight.w400,
                        radius: 40.r,
                        click: () {

                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Categories category) => GestureDetector(
    child: GetBuilder<FilterController>(builder: (controller) => Container(
      margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
      padding: EdgeInsetsDirectional.only(start: 20.r, top: 8.r, end: 20.r, bottom: 8.r),
      decoration: BoxDecoration(
          color: category.isSelected ? AppColors.colorAppMain : AppColors.colorOtherBG,
          borderRadius: BorderRadiusDirectional.circular(40.r)
      ),
      child: AppText.medium(text: category.name, color: category.isSelected ? AppColors.colorWhite : AppColors.colorBlack, fontWeight: category.isSelected ? FontWeight.w400 : FontWeight.w300, fontSize: 14.sp),
    )),
    onTap: () {
      for(var cat in _controller.listCategories){
        cat.isSelected  = false;
      }
      category.isSelected = true;
      _controller.categorySelected = category.id;
      _controller.update();
    }
  );

  Widget _buildSaleItem(Sales sales) => GestureDetector(
      child: GetBuilder<FilterController>(builder: (controller) => Container(
        margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
        padding: EdgeInsetsDirectional.only(start: 20.r, top: 8.r, end: 20.r, bottom: 8.r),
        decoration: BoxDecoration(
            color: sales.isSelected ? AppColors.colorAppMain : AppColors.colorOtherBG,
            borderRadius: BorderRadiusDirectional.circular(40.r)
        ),
        child: AppText.medium(text: sales.name, color: sales.isSelected ? AppColors.colorWhite : AppColors.colorBlack, fontWeight: sales.isSelected ? FontWeight.w400 : FontWeight.w300, fontSize: 14.sp),
      )),
      onTap: () {
        for(var sale in _controller.listSales){
          sale.isSelected  = false;
        }
        sales.isSelected = true;
        // _controller.categorySelected = category.id;
        _controller.update();
      }
  );

  Widget _buildRateItem(Rating rate) => GestureDetector(
      child: GetBuilder<FilterController>(builder: (controller) => Container(
        margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
        padding: EdgeInsetsDirectional.only(start: 10.r, top: 8.r, end: 20.r, bottom: 8.r),
        decoration: BoxDecoration(
            color: rate.isSelected ? AppColors.colorAppMain : AppColors.colorOtherBG,
            borderRadius: BorderRadiusDirectional.circular(40.r)
        ),
        child: Row(
          children: [
            SvgPicture.asset('${Const.icons}icon_star.svg', width: 14.w, height: 14.h),
            SizedBox(width: 8.r),
            AppText.medium(text: rate.name, color: rate.isSelected ? AppColors.colorWhite : AppColors.colorBlack, fontWeight: rate.isSelected ? FontWeight.w400 : FontWeight.w300, fontSize: 14.sp),
          ],
        ),
      )),
      onTap: () {
        for(var rate in _controller.listRating){
          rate.isSelected  = false;
        }
        rate.isSelected = true;
        _controller.ratingSelected = rate.id;
        _controller.update();
      }
  );
}