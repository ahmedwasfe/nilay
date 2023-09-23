import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nilay/controller/vendors/stores/product_details_controller.dart';
import 'package:nilay/model/test/colors.dart';
import 'package:nilay/model/test/product.dart';
import 'package:nilay/model/test/sizes.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';

class ProductDetailsScreen extends StatelessWidget {
  Product? product;
  ProductDetailsScreen({this.product, super.key});

  final _controller = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    _controller.total = product!.price;
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.colorWhite,
        title: AppText.medium(text: 'details', color: AppColors.colorAppMain),
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
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                    width: 314.w,
                    height: 400.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50.r)
                    ),
                    child: CachedImage(imageUrl: product!.image)),
                Container(
                    width: 20.r,
                    height: 20.r,
                    margin: EdgeInsetsDirectional.only(top: 20.r, end: 20.r),
                    padding: EdgeInsetsDirectional.all(4.r),
                    decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius:
                        BorderRadiusDirectional.circular(50.r)),
                    child: SvgPicture.asset(
                        AppHelper.isFavorite(product!.isFavorite))),
              ],
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 40.r, end: 40.r, top: 30.r),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: AppText.medium(text: product!.name,
                          color: AppColors.colorAppMain,
                          fontSize: 18.sp)),
                      GetBuilder<ProductDetailsController>(builder: (controller) => AppText.medium(text: '${_controller.total}\$',
                          color: AppColors.colorAppMain,
                          fontSize: 20.sp, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 30.r),
                      child: AppText.medium(text: product!.description,
                          maxline: 3,
                          color: AppColors.colorTextSub3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400)),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 30.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsetsDirectional.only(end: 5.r),
                              child: AppText.medium(text: 'choose_color',
                                  maxline: 3,
                                  color: AppColors.colorAppMain,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: product!.colors.map((color) => _buildProductColor(color)).toList(),
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 30.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsetsDirectional.only(end: 5.r),
                              child: AppText.medium(text: 'choose_size',
                                  maxline: 3,
                                  color: AppColors.colorAppMain,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: product!.sizes.map((size) => _buildProductSize(size)).toList(),
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 30.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppText.medium(text: 'quantity',
                                maxline: 3,
                                color: AppColors.colorAppMain,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Container(
                              width: 84.w,
                              height: 30.h,
                              alignment: AlignmentDirectional.center,
                              padding: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
                              decoration: BoxDecoration(
                                  color: AppColors.colorAppMain,
                                  borderRadius: BorderRadiusDirectional.circular(6.r)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(padding: EdgeInsets.zero, icon: const Icon(Icons.remove, size: 16, color: Colors.white,),onPressed: () => _controller.decrement(product!.price)),
                                  Obx(() => AppText.medium(text: _controller.quantity.value.toString(), color: AppColors.colorWhite, fontWeight: FontWeight.w400, fontSize: 20.sp)),
                                  IconButton(padding: EdgeInsets.zero, icon: const Icon(Icons.add, size: 16, color: Colors.white,),onPressed: () => _controller.increment(product!.price)),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  GestureDetector(
                    child: Container(
                      width: 175.w,
                      height: 42.h,
                      margin: EdgeInsetsDirectional.only(top: 50.r, bottom: 30.r),
                      decoration: BoxDecoration(
                        color: AppColors.colorAppMain,
                        borderRadius: BorderRadiusDirectional.circular(24.r)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.add, color: Colors.white),
                          AppText.medium(text: 'add_to_cart', color: AppColors.colorWhite)
                        ],
                      ),
                    ),
                    onTap: () {
                      _controller.showProductDetailsBottomSheet(product: product!, context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductColor(ProductColor color) => GestureDetector(
    child: GetBuilder<ProductDetailsController>(builder: (controller) => Container(
      width: 18.r,
      height: 18.r,
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
      for(var color in product!.colors){
        color.isSeleced = false;
      }
      color.isSeleced = true;
      _controller.colorSelcted = color.color;
      _controller.update();
    },
  );

  Widget _buildProductSize(ProductSize size) => GestureDetector(
    child: GetBuilder<ProductDetailsController>(builder: (controller) => Container(
      width: 28.r,
      height: 45.r,
      margin: EdgeInsetsDirectional.only(start: 3.5.r, end: 3.5.r, bottom: 2.r),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          color: size.isSelected ? AppColors.colorTextSub7 : AppColors.colorWhite,
          borderRadius: BorderRadiusDirectional.circular(50.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 4.r, offset: const Offset(0.1, 0.1)
            )
          ]
      ),
      child: AppText.medium(text: size.size, fontSize: 14.sp, fontWeight: FontWeight.w500,
      color: size.isSelected ? AppColors.colorWhite : AppColors.colorBlack),
    )),
    onTap: () {
      for(var size in product!.sizes){
        size.isSelected = false;
      }
      size.isSelected = true;
      _controller.sizeSelected = size.size;
      _controller.update();
    },
  );
}
