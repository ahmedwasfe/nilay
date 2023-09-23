import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/filter/filtter_controller.dart';
import 'package:nilay/model/test/categories.dart';
import 'package:nilay/model/test/colors.dart';
import 'package:nilay/model/test/product_type.dart';
import 'package:nilay/model/test/rating.dart';
import 'package:nilay/model/test/sales.dart';
import 'package:nilay/model/test/sizes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class FilterAllProductsScreen extends StatelessWidget {
  FilterAllProductsScreen({super.key});

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
                            color: _controller.productCategorySelected == 0 ? AppColors.colorAppMain : AppColors.colorOtherBG,
                            borderRadius: BorderRadiusDirectional.circular(40.r)
                        ),
                        child: AppText.medium(text: 'All', color: _controller.productCategorySelected == 0 ? AppColors.colorWhite : AppColors.colorBlack, fontWeight: _controller.productCategorySelected == 0 ? FontWeight.w400 : FontWeight.w300, fontSize: 14.sp),
                      ),
                      onTap: () {
                        for(var category in controller.listProductsCategories){
                          category.isSelected = false;
                        }
                        _controller.productCategorySelected = 0;
                        controller.update();
                      },
                    )),
                    Row(
                      children: _controller.listProductsCategories.map((category) => _buildCategoryItem(category)).toList(),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(text: 'type'),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 10.r, end: 20.r, top: 16.r),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: _controller.listProductType.map((type) => _buildProductTypeItem(type)).toList(),
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
              child: AppText.medium(text: 'colors'),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 10.r, end: 20.r, top: 16.r),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics:
                  const NeverScrollableScrollPhysics(),
                  itemCount: _controller.listProductColors.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 80 / 60,
                    crossAxisCount: 8,
                  ),
                  itemBuilder: (context, index) => _buildProductColor(_controller.listProductColors[index])),
            ),

            Container(
              margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: AppText.medium(text: 'sizes'),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 10.r, end: 20.r, top: 16.r),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: _controller.listProductSizes.map((size) => _buildProductSize(size)).toList(),
                ),
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
      for(var cat in _controller.listProductsCategories){
        cat.isSelected  = false;
      }
      category.isSelected = true;
      _controller.productCategorySelected = category.id;
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

  Widget _buildProductTypeItem(ProductType type) => GestureDetector(
      child: GetBuilder<FilterController>(builder: (controller) => Container(
        margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
        padding: EdgeInsetsDirectional.only(start: 20.r, top: 8.r, end: 20.r, bottom: 8.r),
        decoration: BoxDecoration(
            color: type.isSelected ? AppColors.colorAppMain : AppColors.colorOtherBG,
            borderRadius: BorderRadiusDirectional.circular(40.r)
        ),
        child: AppText.medium(text: type.name, color: type.isSelected ? AppColors.colorWhite : AppColors.colorBlack, fontWeight: type.isSelected ? FontWeight.w400 : FontWeight.w300, fontSize: 14.sp),
      )),
      onTap: () {
        for(var type in _controller.listProductType){
          type.isSelected  = false;
        }
        type.isSelected = true;
        // _controller.categorySelected = category.id;
        _controller.update();
      }
  );

  Widget _buildProductSize(ProductSize size) => GestureDetector(
    child: GetBuilder<FilterController>(builder: (controller) => Container(
      margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
      padding: EdgeInsetsDirectional.only(start: 20.r, top: 8.r, end: 20.r, bottom: 8.r),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          color: size.isSelected ? AppColors.colorAppMain : AppColors.colorOtherBG,
          borderRadius: BorderRadiusDirectional.circular(50.r),
      ),
      child: AppText.medium(text: size.size, color: size.isSelected ? AppColors.colorWhite : AppColors.colorBlack, fontWeight: size.isSelected ? FontWeight.w400 : FontWeight.w300, fontSize: 14.sp),
    )),
    onTap: () {
      for(var size in _controller.listProductSizes){
        size.isSelected = false;
      }
      size.isSelected = true;
      // _controller.sizeSelected = size.size;
      _controller.update();
    },
  );

  Widget _buildProductColor(ProductColor color) => GestureDetector(
    child: GetBuilder<FilterController>(builder: (controller) => Container(
      margin: EdgeInsetsDirectional.only(start: 5.r, end: 5.r),
      decoration: BoxDecoration(
        border: Border.all(color: color.isSeleced ? AppColors.colorAppMain : AppColors.colorWhite),
        borderRadius: BorderRadiusDirectional.circular(50.r),
      ),
      padding: EdgeInsets.all(1.5.r),
      child: Container(
        width: 14.r,
        height: 14.r,
        decoration: BoxDecoration(
            color: color.color,
            borderRadius: BorderRadiusDirectional.circular(50.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4.r),
                  blurRadius: 4.r, offset: Offset(0.1.r, 0.1.r)
              )
            ]
        ),
      ),
    )),
    onTap: () {
      for(var color in _controller.listProductColors){
        color.isSeleced = false;
      }
      color.isSeleced = true;
      // _controller.colorSelcted = color.color;
      _controller.update();
    },
  );

}