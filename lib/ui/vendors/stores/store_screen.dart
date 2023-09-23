import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:nilay/controller/vendors/stores/store_controller.dart';
import 'package:nilay/model/test/vendor_data.dart';
import 'package:nilay/routes/routes.dart';
import 'package:nilay/ui/vendors/stores/product/products_screen.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/widget/vendors/stores/category/category_products_item.dart';
import 'package:nilay/widget/vendors/stores/product/product_best_seller_item.dart';
import 'package:nilay/widget/vendors/stores/product/product_item.dart';
import 'package:nilay/widget/vendors/stores/slider_home_stores_item.dart';

class StoreScreen extends StatelessWidget {

  final _controller = Get.put(StoreController());

  VendorData? vendor;
  StoreScreen({this.vendor, super.key});

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
            vendor!.name.length > 12
                ? Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsetsDirectional.only(top: 16.r),
                    child: Marquee(
              text: vendor!.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.colorAppMain, fontFamily: Const.appFont),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 4.r,
              velocity: 40.0,
              pauseAfterRound: const Duration(milliseconds: 2000),
              startPadding: 10.0,
              accelerationDuration: const Duration(milliseconds: 1000),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 100),
              decelerationCurve: Curves.easeOut)))
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
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                    suffixIcon: GestureDetector(
                      child: SvgPicture.asset(
                          '${Const.icons}icon_filter.svg',
                          fit: BoxFit.scaleDown),
                      onTap: () => Get.toNamed(Routes.filterAllProducts),
                    )),
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
                    .map((silder) => SliderHomeStoresItem(slider: silder))
                    .toList(),
              ),
            ),
            Container(
              margin:
              EdgeInsetsDirectional.only(top: 28.r, start: 20.r, end: 20.r),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: _controller.listCategories.map((category) => CategoryProductsItem(category: category)).toList(),
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
                          text: 'new_arrival', color: AppColors.colorAppMain)),
                  GestureDetector(
                    child: AppText.medium(
                        text: 'see_all',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.colorAppMain),
                    onTap: () => Get.to(ProductsScreen(name: vendor!.name, type: 'new_arrival')),
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
                  children: _controller.listProducts
                      .map((product) => ProductItem(product: product))
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
                          text: 'best_seller', color: AppColors.colorAppMain)),
                  GestureDetector(
                    child: AppText.medium(
                        text: 'see_all',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.colorAppMain),
                    onTap: () => Get.to(ProductsScreen(name: vendor!.name, type: 'best_seller')),
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
                  children: _controller.listProducts
                      .map((product) => ProductBestSellerItem(product: product))
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
                          text: 'most_popular', color: AppColors.colorAppMain)),
                  GestureDetector(
                    child: AppText.medium(
                        text: 'see_all',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.colorAppMain),
                    onTap: () => Get.to(ProductsScreen(name: vendor!.name, type: 'most_popular')),
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
                  children: _controller.listProducts
                      .map((product) =>ProductItem(product: product))
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
